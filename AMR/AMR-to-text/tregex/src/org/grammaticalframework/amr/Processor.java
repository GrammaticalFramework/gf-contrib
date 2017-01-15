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
import java.util.TreeMap;
import java.util.concurrent.TimeUnit;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.grammaticalframework.amr.tregex.Transformer;

import edu.stanford.nlp.util.Pair;

public class Processor {

    private String path_in;
    private String path_out;

    private String file_rules;
    private String file_roles;

    private String batch;

    private boolean unk;
    private boolean eval;

    private List<String> full_snt;

    private Map<String, Integer> unk_rels;
    private Map<String, Integer> unk_nodes;
    private Map<String, Integer> unk_entries;
    private Map<String, Integer> unk_funs;
    private Map<String, Integer> unk_types;

    public static final String FAILURE = "^("
            + "command not parsed:"
            + "|constant not found:"
            + "|unknown qualified constant"
            + "|a function type is expected for"
            + "|record type expected for:"
            + "|no overload instance of"
            + "|missing record fields:"
            + "|warning:"
            + "|Predef.error"
            + "|null"
            + "|\\{s ="
            + ").*";

    public static final String SEPARATOR = "&&&";

    /**
     *
     * @param log
     * @param item
     */
    private static void updateLog(Map<String, Integer> log, String item) {
        Integer freq = log.get(item);

        if (freq == null) {
            freq = 0;
        }

        log.put(item, ++freq);
    }

    /**
     *
     * @param out
     */
    private void logFailures(String out) {
        if (out.toLowerCase().startsWith("command not parsed:")) {
            // e.g. "command not parsed: cc -one (..)"
            Matcher rel = Pattern.compile("(:[A-Za-z0-9-]+)").matcher(out);
            while (rel.find()) {
                updateLog(unk_rels, rel.group(1));
            }
        }

        if (out.toLowerCase().startsWith("constant not found:")) {
            // e.g. "constant not found: take_on"
            updateLog(unk_nodes, out.substring(out.lastIndexOf(" ")));
        }

        if (out.toLowerCase().startsWith("unknown qualified constant")) {
            // e.g. "unknown qualified constant L.attack_V"
            updateLog(unk_entries, out.substring(out.lastIndexOf(" ")));
        }

        if (out.toLowerCase().startsWith("a function type is expected for")) {
            // e.g. "A function type is expected for run_V2 instead of type V2"
            updateLog(unk_funs, out.substring(out.lastIndexOf(" ")));
        }

        if (out.toLowerCase().startsWith("no overload instance of")) {
            // e.g. "no overload instance of mkAdv"
            updateLog(unk_types, out.substring(out.lastIndexOf(" ")));
        }
    }

    /**
     *
     * @param log
     * @param out
     */
    private void writeLog(Map<String, Integer> log, PrintWriter out) {
        int total = 0;

        for (String key : log.keySet()) {
            out.println(log.get(key) + "\t" + key);
            total = total + log.get(key);
        }

        out.println(total + "\tTOTAL");
    }

    /**
     * Constructor.
     *
     * @param path_in
     * @param path_out
     * @param file_rules
     * @param file_roles
     * @param batch
     */
    public Processor(String path_in, String path_out, String file_rules, String file_roles, String batch) {
        this.path_in = path_in;
        this.path_out = path_out;
        this.file_rules = file_rules;
        this.file_roles = file_roles;
        this.batch = batch;
        this.eval = (batch.equals("evaluation")) ? true : false;
        this.full_snt = new ArrayList<String>();
    }

    /**
     *
     * @return
     */
    public List<Pair<String, String>> readAMRs() throws Exception {
        File path_amr = new File(path_in + batch + "/");

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

                if ((!eval && line.startsWith("# ::snt")) || (eval && line.startsWith("# ::id"))) {
                    // Add previous AMR (if any) to the list
                    if (amr.length() > 0) {
                        amrs.add(new Pair<String, String>(snt, amr.toString().trim()));
                        amr.setLength(0);
                        count++;
                    }

                    snt = (eval) ? "" : line.substring("# ::snt".length()).trim();
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
        String filename = "answer-partial";

        if (!unk) {
            filename = "answer";
            full_snt = new ArrayList<String>();
        }

        PrintWriter ans = new PrintWriter(path_out + "out/" + batch + "/" + filename + ".txt", "UTF-8");
        PrintWriter ext = new PrintWriter(path_out + "out/" + batch + "/" + filename + "-extended.txt", "UTF-8");
        PrintWriter xxx = new PrintWriter(path_out + "out/" + batch + "/" + filename + "-extended-amrs.txt", "UTF-8");

        PrintWriter orig = (eval) ? null : new PrintWriter(path_out + "out/" + batch + "/original.txt", "UTF-8");

        int line = 0;

        for (Map<String, String> record : results) {
            String txt = "[" + record.get("TXT").replace(SEPARATOR, "] [") + "]";

            xxx.println("SNT: " + record.get("SNT"));
            xxx.println("AMR: " + record.get("AMR"));
            xxx.println("AST: " + record.get("AST"));
            xxx.println("TXT: " + txt + "\n");

            ext.println("SNT: " + record.get("SNT"));
            ext.println("AST: " + record.get("AST"));
            ext.println("TXT: " + txt + "\n");

            if (orig != null) {
                orig.println(record.get("SNT"));
            }

            String[] snt = record.get("TXT").split(SEPARATOR);

            txt = "";

            for (String s : snt) {
                if (!s.toLowerCase().matches(FAILURE.toLowerCase())) {
                    txt = txt + " " + posteditSentence(s);
                } else {
                    logFailures(s);
                }
            }

            txt = txt.trim();

            if (unk) {
                if (!txt.isEmpty()) {
                    if (txt.equals(full_snt.get(line))) {
                        ans.println("FULL\t" + txt);
                    } else {
                        ans.println("PART\t" + txt);
                    }
                } else {
                    ans.println(txt);
                }
            } else {
                ans.println(txt);
                full_snt.add(txt);
            }

            line++;
        }

        ans.close();
        ext.close();
        xxx.close();

        if (orig != null) {
            orig.close();
        }

        PrintWriter log_rels =
                new PrintWriter(path_out + "log/" + batch + "/" + filename + "-unk-relations.log", "UTF-8");
        PrintWriter log_nodes =
                new PrintWriter(path_out + "log/" + batch + "/" + filename + "-unk-nodes.log", "UTF-8");
        PrintWriter log_entries =
                new PrintWriter(path_out + "log/" + batch + "/" + filename + "-unk-entries.log", "UTF-8");
        PrintWriter log_funs =
                new PrintWriter(path_out + "log/" + batch + "/" + filename + "-unk-functions.log", "UTF-8");
        PrintWriter log_types =
                new PrintWriter(path_out + "log/" + batch + "/" + filename + "-unk-types.log", "UTF-8");

        writeLog(unk_rels, log_rels);
        writeLog(unk_nodes, log_nodes);
        writeLog(unk_entries, log_entries);
        writeLog(unk_funs, log_funs);
        writeLog(unk_types, log_types);

        log_rels.close();
        log_nodes.close();
        log_entries.close();
        log_funs.close();
        log_types.close();
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
        // Bind digits of numbers
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

        // Undo replacement for dates
        snt = snt.replaceAll("\\bone (Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec)", "1 $1");
        snt = snt.replaceAll("\\btwo (Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec)", "2 $1");
        snt = snt.replaceAll("\\bthree (Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec)", "3 $1");
        snt = snt.replaceAll("\\bfour (Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec)", "4 $1");
        snt = snt.replaceAll("\\bfive (Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec)", "5 $1");
        snt = snt.replaceAll("\\bsix (Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec)", "6 $1");
        snt = snt.replaceAll("\\bseven (Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec)", "7 $1");
        snt = snt.replaceAll("\\beight (Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec)", "8 $1");
        snt = snt.replaceAll("\\bnine (Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec)", "9 $1");
        snt = snt.replaceAll("\\bten (Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec)", "10 $1");

        // Remove meaningless words that are often generated in a wrong order
        // snt = snt.replaceAll("\\b(oh|too)\\b", "");

        snt = snt.replaceAll("[ ]{2,}", " ").trim(); // Normalize spaces
        snt = snt.replaceAll(" ([,.!?])", "$1"); // Remove spaces before punctuation
        snt = snt.replaceAll("[.][.]$", "."); // Remove a redundant full-stop

        snt = snt.substring(0, 1).toUpperCase() + snt.substring(1); // Capitalize first letter

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

            String lisp = amr2gf.transformToLISP(amr.second);

            if (lisp == null) {
                System.err.println("AMR failed: " + amr.second);
            }

            String ast = amr2gf.transformToGF(lisp).get(0);

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

        unk_rels = new TreeMap<String, Integer>();
        unk_nodes = new TreeMap<String, Integer>();
        unk_entries = new TreeMap<String, Integer>();
        unk_funs = new TreeMap<String, Integer>();
        unk_types = new TreeMap<String, Integer>();

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
        // Dry run data
        Processor amr2txt = new Processor(
                "../amrs/",
                "out/semeval/",
                "../rules/amr2api.tsurgeon",
                "../lexicons/propbank/frames-roles.txt",
                "dryrun");

        System.out.println();

        System.out.println("# Dry run: full sentences only");
        amr2txt.run(false);

        System.out.println();

        System.out.println("# Dry run: including partial sentences");
        amr2txt.run(true);

        // Evaluation data
        amr2txt = new Processor(
                "../amrs/",
                "out/semeval/",
                "../rules/amr2api.tsurgeon",
                "../lexicons/propbank/frames-roles.txt",
                "evaluation");

        System.out.println();

        System.out.println("# Evaluation: full sentences only");
        amr2txt.run(false);

        System.out.println();

        System.out.println("# Evaluation: including partial sentences");
        amr2txt.run(true);
    }

}
