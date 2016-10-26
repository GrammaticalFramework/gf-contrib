package org.grammaticalframework.amr.peg;

import org.parboiled.BaseParser;
import org.parboiled.Rule;
import org.parboiled.annotations.BuildParseTree;
import org.parboiled.annotations.SkipNode;
import org.parboiled.annotations.SuppressNode;
import org.parboiled.annotations.SuppressSubnodes;

/**
 * A PEG grammar for parsing and rewriting AMR representations, 
 * so that they are compliant with the LISP-like bracketing tree syntax.
 */

@BuildParseTree
public class AMRGrammar extends BaseParser<AMRNode> {

	// ROOT = Instance
	public Rule Root() {
		return Sequence(
			push(new AMRNode("ROOT")),
			Instance(), 
			EOI
		);
	}
	
	// Instance = '(' Var '/' Concept (Relation X)* ')'
	public Rule Instance() {
		return Sequence(
			'(', ZeroOrMore(Space()),
			Var(), push(new AMRNode(match())), (peek(1)).addChild(peek()),
			OneOrMore(Space()), '/', OneOrMore(Space()), 
			Concept(), push(new AMRNode(match())), (peek(1)).addChild(peek()),
			ZeroOrMore(Sequence(
				OneOrMore(Space()),
				Relation(), push(new AMRNode(match())), (peek(1)).addChild(peek()),
				OneOrMore(Space()), 
				X(),
				drop()
			)),
			drop(),
			drop(),
			ZeroOrMore(Space()), ')'
		);
	}

	// Var = [a-z][0-9]*
	@SuppressSubnodes
	public Rule Var() {
		return Sequence(LowerLetter(), ZeroOrMore(Digit()));
	}

	// Concept = [A-Za-z][A-Za-z0-9-]*
	@SuppressSubnodes
	public Rule Concept() {
		return Sequence(
			FirstOf(UpperLetter(), LowerLetter()), 
			ZeroOrMore(FirstOf(UpperLetter(), LowerLetter(), Digit(), '-'))
		);
	}

	// Relation = ':'[A-Za-z][A-Za-z0-9-]*
	@SuppressSubnodes
	public Rule Relation() {
		return Sequence(
			':',
			FirstOf(UpperLetter(), LowerLetter()), 
			ZeroOrMore(FirstOf(UpperLetter(), LowerLetter(), Digit(), '-'))
		);
	}

	// X = Instance | Mode | Var | Str | Num
	@SkipNode
	public Rule X() {
 		return FirstOf(
 			Instance(),
 			Sequence(Mode(), (peek()).addChild(new AMRNode(match()))),
 			Sequence(Var(), (peek()).addChild(new AMRNode(match()))),
 			Sequence(Str(), (peek()).addChild(new AMRNode(match()))),
 			Sequence(Num(), (peek()).addChild(new AMRNode(match())))
 		);
	}

    // Str = '"' [^\"\s]+ '"'
	@SuppressSubnodes
	public Rule Str() {
 		return Sequence('"', OneOrMore(Sequence(TestNot(FirstOf('"', Space())), ANY)), '"');
	}

	// Num = [+-]?\d+(\.\d+)?
	@SuppressSubnodes
	public Rule Num() {
 		return Sequence(
 			Optional(FirstOf('+', '-')), 
 			OneOrMore(Digit()), 
 			Optional(Sequence('.', OneOrMore(Digit())))
 		);
	}
	
	// Mode = interrogative | expressive | imperative
	@SuppressSubnodes
	public Rule Mode() {
 		return FirstOf(String("interrogative"), String("expressive"), String("imperative"));
	}

	@SuppressNode
	public Rule UpperLetter() {
		return CharRange('A', 'Z');
	}

	@SuppressNode
	public Rule LowerLetter() {
		return CharRange('a', 'z');
	}

	@SuppressNode
	public Rule Digit() {
		return CharRange('0', '9');
	}

	@SuppressNode
	public Rule Space() {
		return FirstOf(' ', '\t', '\n', '\r');
	}

}
