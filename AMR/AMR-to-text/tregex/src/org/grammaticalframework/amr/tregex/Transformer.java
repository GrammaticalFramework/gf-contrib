package org.grammaticalframework.amr.tregex;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.io.StringReader;
import java.util.ArrayList;
import java.util.List;

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

	/**
	 * Reads a list of Tregex pattern-matching and Tsurgeon transformation rules.
	 * @param file - a plan-text file containing the list of rules.
	 * @return an ordered list of AMR graph patterns and transformation operations.
	 */
	private List<Pair<String,String>> readRules(String file) throws Exception {
		List<Pair<String,String>> rules = new ArrayList<Pair<String,String>>();
		
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
			
			if (line.startsWith("[") && line.endsWith("]")) {
				ops.append(line);
			} else {
				if (ops.length() > 0) {
					rules.add(new Pair<String,String>(pattern, ops.toString()));
					ops.setLength(0);
				}
				
				pattern = line;
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
	 * TODO: use Tsurgeon.relabel, remove this method; Tsurgeon.relabel is limited, though
	 * @param tree - AST
	 * @return AST'
	 */
	private String postprocessAST(String tree) {
		tree = tree.replaceAll("\\(mkCN ([a-z]+) ([a-z]+)\\)", "(mkCN $1_A $2_N)");
		tree = tree.replaceAll("\\(mkCN ([a-z]+)\\)", "(mkCN $1_N)");
		
		tree = tree.replaceAll("\\(mkVP ([a-z]+)-(\\d+) \\(mkNP", "(mkVP $1_$2_V2 (mkNP");
		tree = tree.replaceAll("\\(mkVP ([a-z]+)-(\\d+) \\(mkVP", "(mkVP $1_$2_VV (mkVP");
		tree = tree.replaceAll("\\(mkVP ([a-z]+)-(\\d+)\\)", "(mkVP $1_$2_V)");
		
		return tree;
	}

	/**
	 * Constructor.
	 * @param file - a plain-text file containing Tregex/Tsurgeon rules.
	 */
	public Transformer(String file) {
		peg = Parboiled.createParser(AMRGrammar.class);
		
		try {
			tregex = compileRules(readRules(file));
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
		Transformer t = new Transformer("../rules/amr2api.tsurgeon");
		
		String amr = t.transformToLISP("");
		System.out.println("AMR: " + amr);
		
		String ast = t.transformToGF(amr).get(0);
		System.out.println("AST: " + ast);
	}

}
