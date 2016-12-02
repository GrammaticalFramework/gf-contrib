package org.grammaticalframework.amr;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.util.ArrayList;
import java.util.List;

import org.grammaticalframework.amr.tregex.Transformer;

public class SemEval2017 {

    /**
     *
     * @param path
     * @return
     */
    public static List<String> readAMRs(File path) throws Exception {
        if (!path.isDirectory()) {
            return null;
        }

        List<String> amrs = new ArrayList<String>();
        StringBuilder amr = new StringBuilder();

        File[] files = path.listFiles();

        for (File f : files) {
            if (!f.getName().endsWith(".txt")) {
                continue;
            }

            BufferedReader input = new BufferedReader(new FileReader(f));
            String line = null;
            int count = 0;

            while ((line = input.readLine()) != null) {
                line = line.trim();

                if (line.startsWith("# ::snt")) {
                    // Add previous AMR (if any) to the list
                    if (amr.length() > 0) {
                        amrs.add(amr.toString().trim());
                        amr.setLength(0);
                        count++;
                    }
                } else if (line.startsWith("#")) {
                    continue;
                } else if (!line.isEmpty()) {
                    amr.append(" " + line);
                }
            }

            // Add last AMR to the list
            if (amr.length() > 0) {
                amrs.add(amr.toString().trim());
                amr.setLength(0);
                count++;
            }

            input.close();

            System.out.println("# " + f.getName() + ": " + count);
        }

        System.out.println("# Total: " + amrs.size() + "\n");

        return amrs;
    }

    /**
     *
     * @param args
     */
    public static void main(String[] args) throws Exception {
        Transformer amr2gf = new Transformer("../rules/amr2api.tsurgeon", "../lexicons/propbank/frames-roles.txt");

        List<String> amrs = readAMRs(new File("../amrs/"));

        for (String amr : amrs) {
            System.out.println("AMR: " + amr);

            String ast = amr2gf.transformToGF(amr2gf.transformToLISP(amr)).get(0);

            System.out.println("AST: " + ast + "\n");
        }
    }

}
