package org.grammaticalframework.amr.tregex;

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
	 * Compiles a list of Tregex pattern-matching and Tsurgeon transformation rules for the AMR to GF AST conversion.
	 * @return an ordered list of rules.
	 */
	private List<Pair<TregexPattern,TsurgeonPattern>> compileTregexRules() {
		List<Pair<TregexPattern,TsurgeonPattern>> rules = new ArrayList<Pair<TregexPattern,TsurgeonPattern>>();

		// mkRCl : RP -> VP -> RCl
		// mkRS : (Tense) -> (Ant) -> (Pol) -> RCl -> RS
		// TODO: Tense, Ant, Pol
		// (:ARG0-of (var frame)) => (mkRS (mkRCl which_RP (mkVP frame)))
		rules.add(new Pair<TregexPattern,TsurgeonPattern>(
				TregexPattern.compile("/^:ARG0-of$/=inv < (/^[a-z][0-9]*$/=var < /^[a-z]+\\-[0-9]+$/)"),
				Tsurgeon.parseOperation("[adjoin (mkRS (mkRCl which_RP (mkVP@))) var]"
						+ "[excise inv inv]")));
		
		// mkRCl : RP -> AP -> RCl
		// mkAP : A -> AP
		// (:ARG2-of (var (frame))) => (mkRS (mkRCl which_RP (mkAP frame)))
		// TODO: Does it fit other ARG2-of cases as well?
		rules.add(new Pair<TregexPattern,TsurgeonPattern>(
				TregexPattern.compile("/^:ARG2-of$/=inv < (/^[a-z][0-9]*$/=var < /^[a-z]+\\-[0-9]+$/)"),
				Tsurgeon.parseOperation("[adjoin (mkRS (mkRCl which_RP (mkAP@))) var]"
						+ "[excise inv inv]")));
		
		// mkCl : VP -> Cl
		// mkS : (Tense) -> (Ant) -> (Pol) -> Cl -> S
		// TODO: Tense, Ant, Pol
		// (var frame) => (mkS (mkCl (mkVP frame)))
		rules.add(new Pair<TregexPattern,TsurgeonPattern>(
				TregexPattern.compile("/^[a-z][0-9]*$/=var < /^[a-z]+\\-[0-9]+$/"),
				Tsurgeon.parseOperation("[adjoin (mkS (mkCl (mkVP@))) var]")));

		// mkCl : NP -> VP -> Cl
		// (mkCl (mkVP (frame :ARG0))) => (mkCl :ARG0 (mkVP frame))
		rules.add(new Pair<TregexPattern,TsurgeonPattern>(
				TregexPattern.compile("mkCl=cl < (mkVP < (/^[a-z]+\\-[0-9]+$/ < /^:ARG0$/=subj))"),
				Tsurgeon.parseOperation("[move subj >1 cl]"
						+ "[excise subj subj]")));

		// mkVP : V2 -> NP -> VP
		// (mkVP (frame :ARG1)) => (mkVP frame :ARG1) 
		rules.add(new Pair<TregexPattern,TsurgeonPattern>(
				TregexPattern.compile("mkVP=vp < (/^[a-z]+\\-[0-9]+$/ < /^:ARG1$/=obj)"),
				Tsurgeon.parseOperation("[move obj >2 vp]"
						+ "[excise obj obj]")));
		
		// ('name' (:op "X") (:op "Y") (:op "Z")) => ('name' (:op "X Y") (:op "Z"))
		// ('name' (:op "X Y") (:op "Z")) => ('name' (:op "X Y Z"))
		rules.add(new Pair<TregexPattern,TsurgeonPattern>(
				TregexPattern.compile("name < ((/^:op[0-9]+$/ < /^\"[A-Z a-z -]+\"$/=x) $+ (/^:op[0-9]+$/=op2 < /^\"[A-Za-z-]+\"$/=y))"),
				Tsurgeon.parseOperation("[relabel y /^\"(.+)\"$/$1/]"
						+ "[relabel x /^\"(.+)\"$/\"$1 ={y}\"/]"
						+ "[delete op2]")));
		
		// mkPN : Str -> PN
		// mkNP : PN -> NP
		// (:name (var ('name' (:op "Named Entity")))) => (:name (mkNP (mkPN "Named Entity")))
		rules.add(new Pair<TregexPattern,TsurgeonPattern>(
				TregexPattern.compile("/^:name$/=ne < (/^[a-z][0-9]*$/=var < (name < (/^:op[0-9]+$/ < /^\"[A-Z a-z -]+\"$/=str)))"),
				Tsurgeon.parseOperation("[adjoinF (mkNP=np (mkPN @)) str]"
						+ "[move np >1 ne]"
						+ "[delete var]")));
		
		// (var (type (:name mkNP))) => (mkNP)
		rules.add(new Pair<TregexPattern,TsurgeonPattern>(
				TregexPattern.compile("/^[a-z][0-9]*$/=var < (/^[a-z]+$/ < (/^:name$/ < mkNP=np))"),
				Tsurgeon.parseOperation("[move np $- var]"
						+ "[delete var]")));
		
		// mkNP : Quant -> Num -> CN -> NP
		// (var entity) => (mkNP a_Quant singularNum (mkCN (var entity))
		// TODO: "!>" seems to be a computationally expensive relation to match...
		rules.add(new Pair<TregexPattern,TsurgeonPattern>(
				TregexPattern.compile("/^[a-z][0-9]*$/=entity < (/^[a-z]+$/ !< /^:op[0-9]+$/) !> /^(mkCN|:mod|:quant|:degree)$/"),
				Tsurgeon.parseOperation("[adjoinF (mkNP a_Quant singularNum (mkCN @)) entity]")));
		
		// mkListNP : NP -> NP -> ListNP
		// (conj (:op mkNP) (:op mkNP)) => (conj (mkListNP mkNP mkNP))
		rules.add(new Pair<TregexPattern,TsurgeonPattern>(
				TregexPattern.compile("/^(and|or)$/ < ((/^:op[0-9]+$/=op1 < mkNP=np1) $+ (/^:op[0-9]+$/=op2 < mkNP=np2))"),
				Tsurgeon.parseOperation("[adjoin (mkListNP=list mkNP@) np1]"
						+ "[move np2 >2 list]"
						+ "[excise op1 op1]"
						+ "[delete op2]")));
		
		// mkListNP : NP -> ListNP -> ListNP
		// (conj mkListNP (:op mkNP)) => (conj (mkListNP mkNP mkListNP))
		rules.add(new Pair<TregexPattern,TsurgeonPattern>(
				TregexPattern.compile("/^(and|or)$/ < (mkListNP=list $+ (/^:op[0-9]+$/=op_n < mkNP=np_n))"),
				Tsurgeon.parseOperation("[adjoin (mkListNP=list_prim mkNP@) np_n]"
						+ "[move list >2 list_prim]"
						+ "[excise op_n op_n]")));
		
		// mkNP : Conj -> ListNP -> NP
		// (var (conj mkListNP)) => (mkNP (conj_Conj mkListNP))
		rules.add(new Pair<TregexPattern,TsurgeonPattern>(
				TregexPattern.compile("/^[a-z][0-9]*$/=var < (/^(and|or)$/=conj < mkListNP=np)"),
				Tsurgeon.parseOperation("[adjoin (mkNP (var=temp@)) var]"
						+ "[move np $- conj]"
						+ "[relabel conj /^(.+)$/$1_Conj/]"
						+ "[excise temp temp]")));
		
		// (mkNP ([quant_Quant] num_Num mkCN (var (entity :quant)))) => (mkNP ([quant_Quant] :quant mkCN (var entity)))
		rules.add(new Pair<TregexPattern,TsurgeonPattern>(
				TregexPattern.compile("mkNP < (/^(singular|plural)Num$/=num1 $+ (mkCN < (/^[a-z][0-9]*$/ < (/^[a-z]+$/ < /^:quant$/=num2))))"),
				Tsurgeon.parseOperation("[replace num1 num2]"
						+ "[delete num2]")));
						
		// mkNP : Det -> CN -> NP
		// (mkNP (quant_Quant (:quant (var det)) [mkCN])) => (mkNP det_Det [mkCN]) 
		rules.add(new Pair<TregexPattern,TsurgeonPattern>(
				TregexPattern.compile("mkNP < (/^[a-z]+_Quant$/=quant $+ (/^:quant$/=temp < (/^[a-z][0-9]*$/ < /^(every|few|many|more|much|some)$/=det)))"),
				Tsurgeon.parseOperation("[relabel det /^(.+)$/$1_Det/]"
						+ "[relabel det /^some_Det$/somePl_Det/]"
						+ "[replace quant det]"
						+ "[delete temp]")));

		// mkCl : NP -> NP -> Cl
		// mkS : (Tense) -> (Ant) -> (Pol) -> Cl -> S
		// TODO: Tense, Ant, Pol
		// 1. (mkNP (mkCN (var (entity (:domain mkNP))))) => (mkS (mkCl (mkNP (mkCN (var (entity (:domain mkNP)))))))
		rules.add(new Pair<TregexPattern,TsurgeonPattern>(
				TregexPattern.compile("(mkNP=nom < (mkCN < (/^[a-z][0-9]*$/ < (/^[a-z]+$/ < /^:domain$/)))) !> mkCl"),
				Tsurgeon.parseOperation("[adjoinF (mkS (mkCl @)) nom]")));
		// 2. (mkS (mkCl (mkNP (mkCN (var (entity (:domain mkNP))))))) => (mkS (mkCl mkNP (mkNP (mkCN (var entity)))))
		rules.add(new Pair<TregexPattern,TsurgeonPattern>(
				TregexPattern.compile("mkCl=cl < (mkNP < (mkCN < (/^[a-z][0-9]*$/ < (/^[a-z]+$/ < /^:domain$/=subj))))"),
				Tsurgeon.parseOperation("[move subj >1 cl]"
						+ "[excise subj subj]")));
		
		// mkRCl : RP -> NP -> RCl
		// TODO
		
		// mkCN : A -> N -> CN
		// (mkCN (var (entity (:mod (var adj))))) => (mkCN (var adj) (var entity))
		rules.add(new Pair<TregexPattern,TsurgeonPattern>(
				TregexPattern.compile("mkCN=cn < (/^[a-z][0-9]*$/ < (/^[a-z]+$/ < (/^:mod$/=mod < /^[a-z][0-9]*$/=adj)))"),
				Tsurgeon.parseOperation("[move adj >1 cn]"
						+ "[delete mod]")));
				
		// mkCN : CN -> RS -> CN
		// (mkCN (var (entity mkRS))) => (mkCN (mkCN (var entity)) mkRS)
		rules.add(new Pair<TregexPattern,TsurgeonPattern>(
				TregexPattern.compile("mkCN=cn1 < (/^[a-z][0-9]*$/ < (/^[a-z]+$/ < mkRS=rs))"),
				Tsurgeon.parseOperation("[adjoin (mkCN=cn2 mkCN@) cn1]"
						+ "[move rs >2 cn2]")));
				
		// (mkCN (var entity)) => (mkCN entity)
		rules.add(new Pair<TregexPattern,TsurgeonPattern>(
				TregexPattern.compile("mkCN < (/^[a-z][0-9]*$/=var < /^[a-z]+$/)"),
				Tsurgeon.parseOperation("[excise var var]")));

		// mkNum : Digits -> Num
		// mkDigits : Str -> Digits
		// (:quant digits) => (mkNum (mkDigits "digits"))
		rules.add(new Pair<TregexPattern,TsurgeonPattern>(
				TregexPattern.compile("/^:quant$/=quant < /^[0-9]+$/=digits"),
				Tsurgeon.parseOperation("[relabel digits /^(.+)$/\"$1\"/]"
						+ "[adjoin (mkNum (mkDigits@)) quant]")));

		// mkVP : VP -> Adv -> VP
		// (mkVP (frame (:adv mkNP))) => (mkVP (mkVP frame) (:adv mkNP))
		rules.add(new Pair<TregexPattern,TsurgeonPattern>(
				TregexPattern.compile("mkVP=vp_i < (/^[a-z]+\\-[0-9]+$/ < /^:(location|topic)$/=adv)"),
				Tsurgeon.parseOperation("[adjoinF (mkVP=vp_o @) vp_i]"
						+ "[move adv >2 vp_o]")));
		
		// mkNP : NP -> Adv -> NP
		// (mkNP (mkCN (entity (:adv mkNP)))) => (mkNP (mkNP (mkCN entity)) (:adv mkNP))
		rules.add(new Pair<TregexPattern,TsurgeonPattern>(
				TregexPattern.compile("mkNP=np_i < (mkCN < (/^[a-z]+$/ < /^:(location|topic)$/=adv))"),
				Tsurgeon.parseOperation("[adjoinF (mkNP=np_o @) np_i]"
						+ "[move adv >2 np_o]")));
		
		// mkAdv : Prep -> NP -> Adv
		// (:location mkNP) => (mkAdv in_Prep mkNP)
		rules.add(new Pair<TregexPattern,TsurgeonPattern>(
				TregexPattern.compile("/^:location$/=rel < mkNP=np"),
				Tsurgeon.parseOperation("[adjoinF (S.mkAdv in_Prep @) np]"
						+ "[excise rel rel]")));
		
		// mkAdv : Prep -> NP -> Adv
		// (:topic mkNP) => (mkAdv about_Prep mkNP)
		rules.add(new Pair<TregexPattern,TsurgeonPattern>(
				TregexPattern.compile("/^:topic$/=rel < mkNP=np"),
				Tsurgeon.parseOperation("[adjoinF (S.mkAdv about_Prep @) np]"
						+ "[excise rel rel]")));
		
		// mkAP : AdA -> AP -> AP
		// (mkAP (frame (:degree (var ada))))
		rules.add(new Pair<TregexPattern,TsurgeonPattern>(
				TregexPattern.compile("mkAP=ap_i < (/^[a-z]+\\-[0-9]+$/=frame < (/^:degree$/=deg < (/^[a-z][0-9]*$/ < /^[a-z]+$/=ada)))"),
				Tsurgeon.parseOperation("[adjoinF (mkAP=ap_o @) ap_i]"
						+ "[move ada >1 ap_o]"
						+ "[relabel ada /^(.+)$/$1_AdA/]"
						+ "[relabel frame /^(.+)-.+$/$1ing_A/]" // TODO: make an adjective form from a verb form 
						+ "[delete deg]")));
		
		return rules;
	}

	/**
	 * TODO: use relabel, remove this method
	 * @param tree
	 * @return
	 */
	private String postprocessAST(String tree) {
		tree = tree.replaceAll("\\(mkCN ([a-z]+) ([a-z]+)\\)", "(mkCN $1_A $2_N)");
		tree = tree.replaceAll("\\(mkCN ([a-z]+)\\)", "(mkCN $1_N)");
		
		tree = tree.replaceAll("\\(mkVP ([a-z]+)-(\\d+) \\(mkNP", "(mkVP $1_$2_V2 (mkNP");
		tree = tree.replaceAll("\\(mkVP ([a-z]+)-(\\d+)\\)", "(mkVP $1_$2_V)");
		
		return tree;
	}

	/**
	 * Constructor.
	 */
	public Transformer() {
		peg = Parboiled.createParser(AMRGrammar.class);
		tregex = compileTregexRules();
	}

	/**
	 * 
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
	 * 
	 * @param args
	 * @throws IOException
	 */
	public static void main(String[] args) throws IOException {
		Transformer t = new Transformer();
		
		String amr = t.transformToLISP("(h / horny :mode expressive :domain (w / woman) :degree (a / as-hell))");
		
		System.out.println("AMR: " + amr);
		
		String ast = t.transformToGF(amr).get(0);
		System.out.println("AST: " + ast);
	}

}
