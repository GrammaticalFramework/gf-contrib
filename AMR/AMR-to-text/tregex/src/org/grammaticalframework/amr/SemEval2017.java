package org.grammaticalframework.amr;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.concurrent.Callable;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;
import java.util.concurrent.TimeUnit;

import edu.stanford.nlp.util.Pair;

public class SemEval2017 {

    /**
     *
     * @param path
     * @return
     */
    public static List<Pair<String, String>> readAMRs(File path) throws Exception {
        if (!path.isDirectory()) {
            return null;
        }

        List<Pair<String, String>> amrs = new ArrayList<Pair<String, String>>();
        StringBuilder amr = new StringBuilder();

        File[] files = path.listFiles();

        for (File f : files) {
            if (!f.getName().endsWith(".txt")) {
                continue;
            }

            BufferedReader input = new BufferedReader(new FileReader(f));
            String line = null;
            String snt = null;
            int count = 0;

            while ((line = input.readLine()) != null) {
                line = line.trim();

                if (line.startsWith("# ::snt")) {
                    // Add previous AMR (if any) to the list
                    if (amr.length() > 0) {
                        amrs.add(new Pair<String, String>(snt, amr.toString().trim()));
                        amr.setLength(0);
                        count++;
                    }

                    snt = line.substring("# ::snt".length()).trim();
                } else if (line.startsWith("#")) {
                    continue;
                } else if (!line.isEmpty()) {
                    amr.append(" " + line);
                }
            }

            // Add last AMR to the list
            if (amr.length() > 0) {
                amrs.add(new Pair<String, String>(snt, amr.toString().trim()));
                amr.setLength(0);
                count++;
            }

            input.close();

            System.out.println(f.getName() + ": " + count);
        }

        System.out.println("Total AMRs: " + amrs.size());

        return amrs;
    }

    /**
     *
     * @param amrs
     * @return
     */
    public static List<Callable<List<Map<String, String>>>> splitTasks(List<Pair<String, String>> amrs) {
        List<Callable<List<Map<String, String>>>> tasks = new ArrayList<Callable<List<Map<String, String>>>>();

        List<Pair<String, String>> batch = new ArrayList<Pair<String, String>>();

        int cores = Runtime.getRuntime().availableProcessors();
        int limit = (amrs.size() / cores) + 1;

        System.out.println("Available processors: " + cores);
        System.out.println("AMRs per processor: " + limit);

        int checksum = 0;
        int counter = 0;

        for (Pair<String, String> amr : amrs) {
            if (counter == limit) {
                tasks.add(new Processor(batch));
                checksum += batch.size();
                batch = new ArrayList<Pair<String, String>>();
                counter = 0;
            }

            batch.add(amr);
            counter++;
        }

        // Add remaining AMRs, if any, as the last batch/task
        if (counter > 0) {
            tasks.add(new Processor(batch));
            checksum += batch.size();
        }

        System.out.println("Checksum: " + checksum + " / " + tasks.size());

        return tasks;
    }

    /**
     *
     * @param batch
     * @param ans
     * @param ext
     * @return
     */
    public static int writeResults(List<Map<String, String>> batch, PrintWriter ans, PrintWriter ext) {
        for (Map<String, String> record : batch) {
            String txt = record.get("TXT");

            ext.println("SNT: " + record.get("SNT"));
            ext.println("AMR: " + record.get("AMR"));
            ext.println("AST: " + record.get("AST"));
            ext.println("TXT: " + txt + "\n");

            if (txt != null && !txt.toLowerCase().matches(Processor.FAILURE)) {
                ans.println(txt);
            } else {
                ans.println();
            }
        }

        return batch.size();
    }

    /**
     *
     * @param args
     */
    public static void main(String[] args) throws Exception {
        List<Callable<List<Map<String, String>>>> tasks = splitTasks(readAMRs(new File("../amrs/")));

        ExecutorService exec = Executors.newFixedThreadPool(tasks.size());

        long startTime = System.currentTimeMillis();

        List<Future<List<Map<String, String>>>> results = exec.invokeAll(tasks, 30, TimeUnit.MINUTES);

        long endTime = System.currentTimeMillis();
        long runTime = endTime - startTime;
        long minutes = TimeUnit.MILLISECONDS.toMinutes(runTime);
        long seconds = TimeUnit.MILLISECONDS.toSeconds(runTime) - TimeUnit.MINUTES.toSeconds(minutes);

        System.out.println("Runtime: " + String.format("%d min, %d sec", minutes, seconds));

        PrintWriter ans = new PrintWriter("out/answer.txt", "UTF-8");
        PrintWriter ext = new PrintWriter("out/answer-extended.txt", "UTF-8");

        int checksum = 0;

        for (Future<List<Map<String, String>>> batch : results) {
            checksum += writeResults(batch.get(1, TimeUnit.SECONDS), ans, ext);
        }

        System.out.println("Resultset: " + checksum);

        ans.close();
        ext.close();

        exec.shutdownNow();
    }

}
