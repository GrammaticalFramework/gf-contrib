package org.grammaticalframework.amr;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.TimeUnit;

import org.grammaticalframework.amr.tregex.Transformer;

import edu.stanford.nlp.util.Pair;

public class Processor {

    private String path_in;
    private String path_out;

    private String file_rules;
    private String file_roles;

    private boolean unk;

    public static final String FAILURE = "^("
            + "command not parsed"
            + "|constant not found"
            + "|unknown qualified constant"
            + "|a function type is expected"
            + "|record type expected"
            + "|no overload instance"
            + "|missing record fields"
            + "|warning:"
            + "|null"
            + "|\\{s ="
            + ").*";

    public static final String SEPARATOR = "&&&";

    /**
     * Constructor.
     *
     * @param path_in
     * @param path_out
     * @param file_rules
     * @param file_roles
     */
    public Processor(String path_in, String path_out, String file_rules, String file_roles) {
        this.path_in = path_in;
        this.path_out = path_out;

        this.file_rules = file_rules;
        this.file_roles = file_roles;

        unk = false;
    }

    /**
     *
     * @return
     */
    public List<Pair<String, String>> readAMRs() throws Exception {
        File path_amr = new File(path_in);

        if (!path_amr.isDirectory()) {
            return null;
        }

        List<Pair<String, String>> amrs = new ArrayList<Pair<String, String>>();
        StringBuilder amr = new StringBuilder();

        File[] files = path_amr.listFiles();

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
     * @param results
     */
    public void writeResults(List<Map<String, String>> results) throws Exception {
        String filename = (!unk) ? "answer" : "answer-partial";

        PrintWriter ans = new PrintWriter(path_out + filename + ".txt", "UTF-8");
        PrintWriter ext = new PrintWriter(path_out + filename + "-extended.txt", "UTF-8");
        PrintWriter xxx = new PrintWriter(path_out + filename + "-extended-amrs.txt", "UTF-8");

        for (Map<String, String> record : results) {
            String txt = "[" + record.get("TXT").replace(SEPARATOR, "] [") + "]";

            xxx.println("SNT: " + record.get("SNT"));
            xxx.println("AMR: " + record.get("AMR"));
            xxx.println("AST: " + record.get("AST"));
            xxx.println("TXT: " + txt + "\n");

            ext.println("SNT: " + record.get("SNT"));
            ext.println("AST: " + record.get("AST"));
            ext.println("TXT: " + txt + "\n");

            String[] snt = record.get("TXT").split(SEPARATOR);

            txt = "";

            for (String s : snt) {
                if (!s.toLowerCase().matches(FAILURE)) {
                    txt = txt + " " + posteditSentence(s);
                }
            }

            ans.println(txt.trim());
        }

        ans.close();
        ext.close();
        xxx.close();
    }

    /**
     * Splits a multi-sentence paragraph into an array of separate sentences.
     *
     * @param ast
     * @return
     */
    public static String[] splitSentences(String ast) {
        ast = ast.replaceAll("^\\(multi-sentence (.+?)\\)$", "$1");
        ast = ast.replace(") (mkText", ")" + SEPARATOR + "(mkText");

        return ast.split(SEPARATOR);
    }

    /**
     *
     * @param snt
     * @return
     */
    public static String mergeSentences(String[] snt) {
        String txt = "";

        for (String s : snt) {
            if (!txt.isEmpty()) {
                txt = txt + SEPARATOR;
            }

            txt = txt + s;
        }

        return txt;
    }

    /**
     *
     * @param snt
     * @return
     */
    public static String posteditSentence(String snt) {
        snt = snt.replaceAll("([ ]*Predef[.]BIND[ ]*)", "");

        // Replace [0..10] with words
        snt = snt.replaceAll("\\b(?<!\\d[,.])0(?![,.]\\d)\\b", "zero");
        snt = snt.replaceAll("\\b(?<!\\d[,.])1(?![,.]\\d)\\b", "one");
        snt = snt.replaceAll("\\b(?<!\\d[,.])2(?![,.]\\d)\\b", "two");
        snt = snt.replaceAll("\\b(?<!\\d[,.])3(?![,.]\\d)\\b", "three");
        snt = snt.replaceAll("\\b(?<!\\d[,.])4(?![,.]\\d)\\b", "four");
        snt = snt.replaceAll("\\b(?<!\\d[,.])5(?![,.]\\d)\\b", "five");
        snt = snt.replaceAll("\\b(?<!\\d[,.])6(?![,.]\\d)\\b", "six");
        snt = snt.replaceAll("\\b(?<!\\d[,.])7(?![,.]\\d)\\b", "seven");
        snt = snt.replaceAll("\\b(?<!\\d[,.])8(?![,.]\\d)\\b", "eight");
        snt = snt.replaceAll("\\b(?<!\\d[,.])9(?![,.]\\d)\\b", "nine");
        snt = snt.replaceAll("\\b(?<!\\d[,.])10(?![,.]\\d)\\b", "ten");

        snt = snt.substring(0, 1).toUpperCase() + snt.substring(1); // Capitalize first letter
        snt = snt.replaceAll(" ([,.!?])", "$1"); // Remove spaces before punctuation

        return snt;
    }

    /**
     *
     * @param amrs
     * @return
     */
    public List<Map<String, String>> processAMRs(List<Pair<String, String>> amrs) throws Exception {
        List<Map<String, String>> results = new ArrayList<Map<String, String>>();

        Transformer amr2gf = new Transformer(file_rules, file_roles, unk);

        for (Pair<String, String> amr : amrs) {
            Map<String, String> record = new HashMap<String, String>();

            record.put("SNT", amr.first);
            record.put("AMR", amr.second);

            String ast = amr2gf.transformToGF(amr2gf.transformToLISP(amr.second)).get(0);

            String[] snt = splitSentences(ast); // Because of multi-sentence AMRs

            for (int i = 0; i < snt.length; i++) {
                FileOutputStream output = new FileOutputStream(path_out + "fifo.in");
                PrintWriter pipe_ast = new PrintWriter(new OutputStreamWriter(output));

                FileInputStream input = new FileInputStream(path_out + "fifo.out");
                BufferedReader pipe_txt = new BufferedReader(new InputStreamReader(input));

                pipe_ast.println("cc -one " + snt[i]);
                pipe_ast.flush();

                while (input.available() == 0) {
                    Thread.sleep(10);
                }

                String text = null;
                String line = null;

                // Read the piped output stream of the executed command
                while (input.available() > 0) {
                    line = pipe_txt.readLine();

                    if (text == null) {
                        text = line; // Take only the first line
                    }

                    Thread.sleep(10);
                }

                snt[i] = text;

                pipe_txt.close();
                pipe_ast.close();
            }

            record.put("AST", ast);
            record.put("TXT", mergeSentences(snt));

            results.add(record);
        }

        return results;
    }

    /**
     *
     * @param unk
     */
    public void run(boolean unk) throws Exception {
        this.unk = unk;

        long startTime = System.currentTimeMillis();

        writeResults(processAMRs(readAMRs()));

        long endTime = System.currentTimeMillis();
        long runTime = endTime - startTime;
        long minutes = TimeUnit.MILLISECONDS.toMinutes(runTime);
        long seconds = TimeUnit.MILLISECONDS.toSeconds(runTime) - TimeUnit.MINUTES.toSeconds(minutes);

        System.out.println("Runtime: " + String.format("%d min, %d sec", minutes, seconds));
    }

    /**
     *
     * @param args
     */
    public static void main(String[] args) throws Exception {
        Processor amr2txt = new Processor(
                "../amrs/",
                "out/semeval/",
                "../rules/amr2api.tsurgeon",
                "../lexicons/propbank/frames-roles.txt");

        System.out.println("# Run: full sentences only");
        amr2txt.run(false);

        System.out.println();

        System.out.println("# Run: including partial sentences");
        amr2txt.run(true);
    }

}
