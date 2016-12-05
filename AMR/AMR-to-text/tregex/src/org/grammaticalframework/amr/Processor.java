package org.grammaticalframework.amr;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.Callable;

import org.grammaticalframework.amr.tregex.Transformer;

import edu.stanford.nlp.util.Pair;

public class Processor implements Callable<List<Map<String, String>>> {

    private Transformer amr2gf;

    private List<Pair<String, String>> amrs;

    public static final String FAILURE =
            "^(command not parsed|constant not found|unknown qualified constant|a function type is expected|record type expected).+";

    /**
     *
     * @param amrs
     */
    public Processor(List<Pair<String, String>> amrs) {
        amr2gf = new Transformer("../rules/amr2api.tsurgeon", "../lexicons/propbank/frames-roles.txt");
        this.amrs = amrs;
    }

    /**
     *
     * @param term
     * @param grammar
     * @param snt
     * @return
     */
    private static String computeConcrete(String term, String grammar, String snt) {
        String gf = "/Users/normundsg/Library/Haskell/bin/gf";

        String[] cmd = {
                "/bin/sh",
                "-c",
                "echo \"cc -one " + term + "\" | " + gf + " +RTS -K1024M -RTS --no-recomp --run -retain " + grammar
        };

        String text = null;

        try {
            Process proc = Runtime.getRuntime().exec(cmd);

            BufferedReader stdout = new BufferedReader(new InputStreamReader(proc.getInputStream()));
            BufferedReader stderr = new BufferedReader(new InputStreamReader(proc.getErrorStream()));

            String line = null;

            // Read the standard output stream of the executed command
            while ((line = stdout.readLine()) != null) {
                if (text == null) {
                    text = line; // Take only the first line
                }
            }

            // Read the standard error stream of the executed command
            while ((line = stderr.readLine()) != null) {
                System.err.println("### STDERR - " + Thread.currentThread().getName());
                System.err.println("|-- " + snt);
                System.err.println("|-- " + term);
                System.err.println("|-- " + line);
            }

            // Wait while the process exits, returning a status code
            int status = proc.waitFor();
            if (status != 0) {
                System.err.println("### STATUS - " + Thread.currentThread().getName());
                System.err.println("|-- " + snt);
                System.err.println("|-- " + term);
                System.err.println("|-- " + status);
            }
        } catch (Exception e) {
            System.err.println("### EXCEPTION - " + Thread.currentThread().getName());
            System.err.println("|-- " + snt);
            System.err.println("|-- " + term);
            e.printStackTrace(System.err);
        }

        return text;
    }

    @Override
    public List<Map<String, String>> call() {
        List<Map<String, String>> results = new ArrayList<Map<String, String>>();

        System.out.println("Start: " + Thread.currentThread().getName() + " (" + amrs.size() + ")");

        for (Pair<String, String> amr : amrs) {
            Map<String, String> record = new HashMap<String, String>();

            record.put("SNT", amr.first);
            record.put("AMR", amr.second);

            String ast = amr2gf.transformToGF(amr2gf.transformToLISP(amr.second)).get(0);

            String txt = computeConcrete(ast, "out/TestTreesEng.gf", amr.first);

            record.put("AST", ast);
            record.put("TXT", txt);

            if (txt != null && !txt.toLowerCase().matches(FAILURE)) {
                System.out.println("TXT: " + record.get("SNT") + " => " + record.get("TXT"));
            }

            results.add(record);
        }

        System.out.println("Finish: " + Thread.currentThread().getName() + " (" + results.size() + ")");

        return results;
    }

}
