package org.grammaticalframework.amr;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import org.grammaticalframework.amr.tregex.Transformer;

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

        System.out.println("Total: " + amrs.size() + "\n");

        return amrs;
    }

    /**
     *
     * @param args
     */
    public static void main(String[] args) throws Exception {
        Transformer amr2gf = new Transformer("../rules/amr2api.tsurgeon", "../lexicons/propbank/frames-roles.txt");

        List<Pair<String, String>> amrs = readAMRs(new File("../amrs/"));

        PrintWriter answer_ext = new PrintWriter("out/answer-extended.txt", "UTF-8");
        PrintWriter answer = new PrintWriter("out/answer.txt", "UTF-8");

        for (Pair<String, String> amr : amrs) {
            answer_ext.println("SNT: " + amr.first);
            answer_ext.println("AMR: " + amr.second);

            String ast = amr2gf.transformToGF(amr2gf.transformToLISP(amr.second)).get(0);

            answer_ext.println("AST: " + ast);
            answer_ext.println("TXT: " + "\n"); // TODO

            answer.println("TXT: "); // TODO
        }

        answer_ext.close();
        answer.close();
    }

}
