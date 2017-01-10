package org.grammaticalframework.amr.tregex;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.io.StringReader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Stack;

import org.grammaticalframework.amr.peg.AMRGrammar;
import org.parboiled.Parboiled;
import org.parboiled.parserunners.BasicParseRunner;
import org.parboiled.support.ParsingResult;

import edu.stanford.nlp.trees.PennTreeReader;
import edu.stanford.nlp.trees.Tree;
import edu.stanford.nlp.trees.TreeReader;
import edu.stanford.nlp.trees.tregex.TregexPattern;
import edu.stanford.nlp.trees.tregex.tsurgeon.Tsurgeon;
import edu.stanford.nlp.trees.tregex.tsurgeon.TsurgeonPattern;
import edu.stanford.nlp.util.Pair;

/**
 * AMR-to-AST transformer. Uses the Tregex/Tsurgeon package of the Stanford JavaNLP library.
 *
 * The current implementation produces API constructor application trees instead of the actual ASTs.
 */
public class Transformer {

    private AMRGrammar peg;

    private List<Pair<TregexPattern, TsurgeonPattern>> tregex;

    private Map<String, Map<String, String>> roles;

    /**
     *
     * @param file
     * @return
     */
    private Map<String, Map<String, String>> readRoles(String file) throws Exception {
        Map<String, Map<String, String>> map = new HashMap<String, Map<String, String>>();

        BufferedReader input = new BufferedReader(new FileReader(file));
        String line = null;

        while ((line = input.readLine()) != null) {
            if (line.trim().isEmpty()) {
                continue;
            }

            String[] entry = line.split("\t");
            if (entry.length != 2) {
                continue;
            }

            Map<String, String> arg_role = new HashMap<String, String>();
            for (String arg : entry[1].split(",")) {
                String[] a = arg.split("=");
                arg_role.put(a[0], a[1]);
            }

            map.put(entry[0], arg_role);
        }

        input.close();

        return map;
    }

    /**
     *
     * @param line
     * @param macros
     * @return
     */
    private String expandMacros(String line, Map<String, String> macros) {
        for (String from : macros.keySet()) {
            String to = macros.get(from);
            if (line.startsWith("[") && line.endsWith("]")) {
                // In case of operations, expand only sub-patterns marked by ~
                line = line.replace("~" + from, "~" + to);
            } else {
                line = line.replace(from, to);
            }
        }

        // Convert a whole-string pattern into a sub-pattern if marked by ~
        line = line.replaceAll("~/\\^(.+?)\\$/", "$1");

        return line;
    }

    /**
     * Reads a list of Tregex pattern-matching and Tsurgeon transformation rules.
     *
     * @param file
     *        A plain-text file containing the list of rules.
     * @param unk
     *        If true, reads extra rules that cut off unresolved subgraphs.
     * @return An ordered list of AMR graph patterns and transformation operations.
     */
    private List<Pair<String, String>> readRules(String file, boolean unk) throws Exception {
        List<Pair<String, String>> rules = new ArrayList<Pair<String, String>>();

        Map<String, String> macros = new HashMap<String, String>();

        BufferedReader input = new BufferedReader(new FileReader(file));

        String line = null;
        String pattern = null;
        StringBuilder ops = new StringBuilder();

        while ((line = input.readLine()) != null) {
            line = line.trim();

            if (line.startsWith("%")) {
                break; // Used for development purposes
            }

            if (line.startsWith("---") && !unk) {
                break; // Ignore extra rules that cut off unresolved subgraphs
            }

            if (line.contains("#")) {
                line = line.substring(0, line.indexOf("#")).trim();
            }

            if (line.isEmpty()) {
                continue;
            }

            if (line.startsWith("@")) {
                String[] m = line.split("=");
                macros.put(m[0].substring(1), m[1]);
            } else if (line.startsWith("[") && line.endsWith("]")) {
                ops.append(expandMacros(line, macros));
            } else {
                if (ops.length() > 0) {
                    rules.add(new Pair<String, String>(pattern, ops.toString()));
                    ops.setLength(0);
                }

                pattern = expandMacros(line, macros);
            }
        }

        input.close();

        // Last rule
        if (pattern != null) {
            rules.add(new Pair<String, String>(pattern, ops.toString()));
        }

        return rules;
    }

    /**
     * Compiles a list of Tregex pattern-matching and Tsurgeon transformation rules.
     *
     * @param rules
     *        A list of rules provided by readRules().
     * @return An ordered list of compiled rules.
     */
    private List<Pair<TregexPattern, TsurgeonPattern>> compileRules(List<Pair<String, String>> rules) {
        List<Pair<TregexPattern, TsurgeonPattern>> c_rules = new ArrayList<Pair<TregexPattern, TsurgeonPattern>>();

        for (Pair<String, String> r : rules) {
            c_rules.add(new Pair<TregexPattern, TsurgeonPattern>(
                    TregexPattern.compile(r.first),
                    Tsurgeon.parseOperation(r.second)));
        }

        return c_rules;
    }

    /**
     * Constructor.
     *
     * @param f_rules
     *        A plain-text file containing Tregex/Tsurgeon rules.
     * @param f_roles
     * @param unk
     */
    public Transformer(String f_rules, String f_roles, boolean unk) {
        peg = Parboiled.createParser(AMRGrammar.class);

        try {
            tregex = compileRules(readRules(f_rules, unk));
            roles = readRoles(f_roles);
        } catch (Exception e) {
            e.printStackTrace(System.err);
        }
    }

    /**
     * Converts the PENMAN notation to a LISP-like syntax.
     *
     * @param amr
     *        An AMR graph in the tree-like PENMAN notation.
     * @return A slightly rewritten AMR representation compliant with the LISP-like bracketing tree
     *         syntax, or null if the AMR graph is not recognized.
     */
    public String transformToLISP(String amr) {
        ParsingResult<?> result = new BasicParseRunner<>(peg.Root()).run(amr);

        if (result.matched) {
            String lisp = result.parseTreeRoot.getValue().toString();
            lisp = lisp.replace(")(", ") (");
            return lisp;
        }

        return null;
    }

    /**
     *
     * @param amr
     */
    public void enrichAMR(Tree node, Stack<Tree> parents) {
        String label = node.label().value();

        if (label.matches(":ARG[2-9]")) {
            String frame = parents.peek().label().value();

            frame = frame.replaceAll("([a-z])-([a-z])", "$1_$2"); // e.g. go-back-19 => go_back-19

            if (roles.containsKey(frame)) {
                Map<String, String> roleset = roles.get(frame);

                if (roleset.containsKey(label.substring(1))) {
                    String role = roleset.get(label.substring(1));
                    node.label().setValue(label + "-" + role);
                }
            }
        }

        parents.push(node);

        for (Tree n : node.children()) {
            enrichAMR(n, parents);
        }

        parents.pop();
    }

    /**
     * Fixes things that were impossible to handle by Tsurgeon.
     *
     * @param ast
     * @return
     */
    public String postprocessAST(String ast) {
        ast = ast.replace("10_Month", "october_Month");
        ast = ast.replace("11_Month", "november_Month");
        ast = ast.replace("12_Month", "december_Month");

        ast = ast.replace("1_Month", "january_Month");
        ast = ast.replace("2_Month", "february_Month");
        ast = ast.replace("3_Month", "march_Month");
        ast = ast.replace("4_Month", "april_Month");
        ast = ast.replace("5_Month", "may_Month");
        ast = ast.replace("6_Month", "june_Month");
        ast = ast.replace("7_Month", "july_Month");
        ast = ast.replace("8_Month", "august_Month");
        ast = ast.replace("9_Month", "september_Month");

        return ast;
    }

    /**
     * Transforms an AMR graph into a GF abstract syntax tree.
     *
     * @param amr
     *        One or more AMR graphs in the LISP-like bracketing tree syntax.
     * @return A list of GF abstract syntax trees (AST) acquired from the AMR graphs.
     */
    public List<String> transformToGF(String amr) {
        List<String> ast = new ArrayList<String>();
        TreeReader penn = null;

        if (amr != null) {
            penn = new PennTreeReader(new StringReader(amr));
        } else {
            ast.add("NULL");
            return ast;
        }

        try {
            // First input tree
            Tree input = penn.readTree();

            while (input != null) {
                enrichAMR(input, new Stack<Tree>());

                Tree output = Tsurgeon.processPatternsOnTree(tregex, input);

                if (output != null) {
                    ast.add(postprocessAST(output.toString()));
                } else {
                    ast.add("NULL");
                    System.err.println("Tsurgeon failed: " + input);
                }

                // Next input tree
                input = penn.readTree();
            }

            penn.close();
        } catch (IOException e) {
            System.err.println(e.getMessage());
        }

        return ast;
    }

    /**
     * Used for development purposes only.
     */
    public static void main(String[] args) {
        Transformer amr2gf =
                new Transformer("../rules/amr2api.tsurgeon", "../lexicons/propbank/frames-roles.txt", false);

        String amr = amr2gf.transformToLISP("");
        System.out.println("AMR: " + amr);

        String ast = amr2gf.transformToGF(amr).get(0);
        System.out.println("AST: " + ast);
    }

}
