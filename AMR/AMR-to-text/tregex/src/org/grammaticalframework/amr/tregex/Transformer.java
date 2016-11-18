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
import edu.stanford.nlp.trees.TreeReader;
import edu.stanford.nlp.trees.Tree;
import edu.stanford.nlp.trees.tregex.TregexPattern;
import edu.stanford.nlp.trees.tregex.tsurgeon.Tsurgeon;
import edu.stanford.nlp.trees.tregex.tsurgeon.TsurgeonPattern;
import edu.stanford.nlp.util.Pair;

/**
 * AMR-to-AST transformer.
 * Uses the Tregex/Tsurgeon package of the Stanford JavaNLP library.
 * The current implementation produces API constructor application trees instead of the actual ASTs.
 */
public class Transformer {

	private AMRGrammar peg;
	
	private List<Pair<TregexPattern,TsurgeonPattern>> tregex;
	
	private Map<String, Map<String,String>> roles;
	
	/**
	 * 
	 * @param file
	 * @return
	 */
	private Map<String, Map<String,String>> readRoles(String file) throws Exception {
		Map<String, Map<String,String>> map = new HashMap<String, Map<String,String>>();
		
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
			
			Map<String,String> arg_role = new HashMap<String,String>();
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
	 * Reads a list of Tregex pattern-matching and Tsurgeon transformation rules.
	 * @param file - a plan-text file containing the list of rules.
	 * @return an ordered list of AMR graph patterns and transformation operations.
	 */
	private List<Pair<String,String>> readRules(String file) throws Exception {
		List<Pair<String,String>> rules = new ArrayList<Pair<String,String>>();
		
		Map<String,String> macros = new HashMap<String,String>();
		
		BufferedReader input = new BufferedReader(new FileReader(file));
		
		String line = null;
		String pattern = null;
		StringBuilder ops = new StringBuilder();
		
		while ((line = input.readLine()) != null) {
			line = line.trim();
			
			if (line.startsWith("%")) {
				break; // Used for development purposes
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
				ops.append(line);
			} else {
				if (ops.length() > 0) {
					rules.add(new Pair<String,String>(pattern, ops.toString()));
					ops.setLength(0);
				}
				
				pattern = line;
				
				for (String from : macros.keySet()) {
					String to = macros.get(from);
					pattern = pattern.replace(from, to);
				}
				
				// Convert a whole-label pattern into a sub-pattern if marked by ~
				pattern = pattern.replaceAll("~/\\^(.+?)\\$/", "$1");
			}
		}
		
		input.close();
		
		// Last rule
		if (pattern != null) {
			rules.add(new Pair<String,String>(pattern, ops.toString()));
		}
		
		return rules;
	}
	
	/**
	 * Compiles a list of Tregex pattern-matching and Tsurgeon transformation rules.
	 * @param rules - a list of rules provided by readRules().
	 * @return an ordered list of compiled rules.
	 */
	private List<Pair<TregexPattern,TsurgeonPattern>> compileRules(List<Pair<String,String>> rules) {
		List<Pair<TregexPattern,TsurgeonPattern>> c_rules = new ArrayList<Pair<TregexPattern,TsurgeonPattern>>();

		for (Pair<String,String> r : rules) { 
			c_rules.add(new Pair<TregexPattern,TsurgeonPattern>(
				TregexPattern.compile(r.first),
				Tsurgeon.parseOperation(r.second)));
		}
		
		return c_rules;
	}

	/**
	 * Constructor.
	 * @param f_rules - a plain-text file containing Tregex/Tsurgeon rules.
	 * @param f_roles - 
	 */
	public Transformer(String f_rules, String f_roles) {
		peg = Parboiled.createParser(AMRGrammar.class);
		
		try {
			tregex = compileRules(readRules(f_rules));
			roles = readRoles(f_roles);
		} catch (Exception e) {
			e.printStackTrace(System.err);
		}
	}

	/**
	 * Converts the PENMAN notation to a LISP-like syntax.
	 * @param amr - an AMR graph in the tree-like PENMAN notation.
	 * @return a slightly rewritten AMR representation compliant with the LISP-like bracketing tree syntax,
	 * or null if the AMR graph is not recognized.
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
			
			if (roles.containsKey(frame)) {
				Map<String,String> roleset = roles.get(frame);
			
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
	 * Fix things that were impossible to handle by Tsurgeon. 
	 * @param ast
	 * @return
	 */
	public String postprocessAST(String ast) {
		ast = ast.replaceAll("\\(S[.]mkAdv ([a-z]+)-([a-z]+)-([a-z]+)\\)", "(S.mkAdv L.$1_Prep (mkNP S.$2_Det (mkCN L.$3_N)))");
		
		return ast;
	}

	/**
	 * Transforms an AMR graph into a GF abstract syntax tree.
	 * @param amr - one or more AMR graphs in the LISP-like bracketing tree syntax.
	 * @return a list of GF abstract syntax trees (AST) acquired from the AMR graphs.
	 */
	public List<String> transformToGF(String amr) {
		List<String> ast = new ArrayList<String>();
		TreeReader penn = new PennTreeReader(new StringReader(amr));

		try {
			// First input tree
			Tree input = penn.readTree();

			while (input != null) {
				enrichAMR(input, new Stack<Tree>());
				
				Tree output = Tsurgeon.processPatternsOnTree(tregex, input);
				ast.add(postprocessAST(output.toString()));

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
		Transformer t = new Transformer("../rules/amr2api.tsurgeon", "../lexicons/propbank/frames-roles.txt");
		
		String amr = t.transformToLISP("");
		System.out.println("AMR: " + amr);
		
		String ast = t.transformToGF(amr).get(0);
		System.out.println("AST: " + ast);
	}

}
