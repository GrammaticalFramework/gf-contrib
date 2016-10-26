package org.grammaticalframework.amr.tregex;

import static org.junit.Assert.assertEquals;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;

import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runners.MethodSorters;

/**
 * Unit tests for the AMR-to-AST transformer.
 * Running the test suite also produces a compilable GF grammar for testing the partially multilingual linearizations.
 */
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class Tester {

	public static final String name = "TestTrees";
	public static final String path = "out" + File.separator + name;
	
	@BeforeClass
	public static void generateHeader() {
		try {
			PrintWriter abs = new PrintWriter(new FileWriter(path + ".gf"));
			PrintWriter eng = new PrintWriter(new FileWriter(path + "Eng.gf"));
			PrintWriter lav = new PrintWriter(new FileWriter(path + "Lav.gf"));
			PrintWriter rus = new PrintWriter(new FileWriter(path + "Rus.gf"));
			PrintWriter gfs = new PrintWriter(new FileWriter(path + ".gfs"));
			
			abs.println("abstract " + name + " = TestLexicon ** {");
			abs.println("\n\tflags startcat = S ;\n");
			
			eng.println("--# -path=.:alltenses");
			eng.println("concrete " + name + "Eng of " + name + " = TestLexiconEng **");
			eng.println("open SyntaxEng, (S = SyntaxEng), ParadigmsEng in {");
			eng.println("\n\tflags language = en_US ;\n");
			
			lav.println("--# -path=.:alltenses");
			lav.println("concrete " + name + "Lav of " + name + " = TestLexiconLav **");
			lav.println("open SyntaxLav, (S = SyntaxLav), ParadigmsLav in {");
			lav.println("\n\tflags language = lv_LV ;\n");
			
			rus.println("--# -path=.:alltenses");
			rus.println("concrete " + name + "Rus of " + name + " = TestLexiconRus **");
			rus.println("open SyntaxRus, (S = SyntaxRus), ParadigmsRus in {");
			rus.println("\n\tflags language = ru_RU ;\n");
			
			gfs.println("import " + name + "Eng.gf" + " " + name + "Lav.gf" + " " + name + "Rus.gf\n");
			
			abs.close();
			eng.close();
			lav.close();
			rus.close();
			gfs.close();
		} catch (IOException e) {
			System.err.println(e.getMessage());
		}
	}
	
	public static void generateBody(String fun, String lin, boolean alllang) {
		try {
			PrintWriter abs = new PrintWriter(new FileWriter(path + ".gf", true));
			PrintWriter eng = new PrintWriter(new FileWriter(path + "Eng.gf", true));
			PrintWriter lav = new PrintWriter(new FileWriter(path + "Lav.gf", true));
			PrintWriter rus = new PrintWriter(new FileWriter(path + "Rus.gf", true));
			PrintWriter gfs = new PrintWriter(new FileWriter(path + ".gfs", true));
			
			abs.println("\tfun " + fun + " : S ;");
			eng.println("\tlin " + fun + " = " + lin + " ;\n");
			
			if (alllang) {
				lav.println("\tlin " + fun + " = " + lin + " ;\n");
				rus.println("\tlin " + fun + " = " + lin + " ;\n");
			}
			
			gfs.println("lin -treebank " + fun);
			
			abs.close();
			eng.close();
			lav.close();
			rus.close();
			gfs.close();
		} catch (IOException e) {
			System.err.println(e.getMessage());
		}
	}
	
	@AfterClass
	public static void generateFooter() {
		try {
			PrintWriter abs = new PrintWriter(new FileWriter(path + ".gf", true));
			PrintWriter eng = new PrintWriter(new FileWriter(path + "Eng.gf", true));
			PrintWriter lav = new PrintWriter(new FileWriter(path + "Lav.gf", true));
			PrintWriter rus = new PrintWriter(new FileWriter(path + "Rus.gf", true));
			
			abs.println("\n}");
			eng.println("}");
			lav.println("}");
			rus.println("}");
			
			abs.close();
			eng.close();
			lav.close();
			rus.close();
		} catch (IOException e) {
			System.err.println(e.getMessage());
		}
	}
	
	// Girls see a boy.
	@Test
	public void t01_girls_see_a_boy() {
		Transformer t = new Transformer();
		
		String amr = t.transformToLISP("(x2 / see-01\n\t:ARG0 (x1 / girl)\n\t:ARG1 (x4 / boy))");
		assertEquals(amr, "(x2 (see-01 (:ARG0 (x1 girl)) (:ARG1 (x4 boy))))");
		
		String ast = t.transformToGF(amr).get(0);
		assertEquals(ast, "(mkS (mkCl (mkNP a_Quant singularNum (mkCN girl_N)) (mkVP see_01_V2 (mkNP a_Quant singularNum (mkCN boy_N)))))");
		
		generateBody(Thread.currentThread().getStackTrace()[1].getMethodName(), ast, true);
	}
	
	// The boy is seen by the girls.
	@Test
	public void t02_the_boy_is_seen_by_the_girls() {
		Transformer t = new Transformer();
			
		String amr = t.transformToLISP("(x4 / see-01\n\t:ARG1 (x2 / boy)\n\t:ARG0 (x7 / girl))");
		assertEquals(amr, "(x4 (see-01 (:ARG1 (x2 boy)) (:ARG0 (x7 girl))))");
			
		String ast = t.transformToGF(amr).get(0);
		assertEquals(ast, "(mkS (mkCl (mkNP a_Quant singularNum (mkCN girl_N)) (mkVP see_01_V2 (mkNP a_Quant singularNum (mkCN boy_N)))))");
		
		generateBody(Thread.currentThread().getStackTrace()[1].getMethodName(), ast, true);
	}

	// Two girls see a boy.
	@Test
	public void t03_two_girls_see_a_boy() {
		Transformer t = new Transformer();
		
		String amr = t.transformToLISP("(x3 / see-01\n\t:ARG0 (x2 / girl\n\t\t:quant 2)\n\t:ARG1 (x5 / boy))");
		assertEquals(amr, "(x3 (see-01 (:ARG0 (x2 (girl (:quant 2)))) (:ARG1 (x5 boy))))");
		
		String ast = t.transformToGF(amr).get(0);
		assertEquals(ast, "(mkS (mkCl (mkNP a_Quant (mkNum (mkDigits \"2\")) (mkCN girl_N)) (mkVP see_01_V2 (mkNP a_Quant singularNum (mkCN boy_N)))))");
		
		generateBody(Thread.currentThread().getStackTrace()[1].getMethodName(), ast, true);
	}

	// Two pretty girls see a boy.
	@Test
	public void t04_two_pretty_girls_see_a_boy() {
		Transformer t = new Transformer();
		
		String amr = t.transformToLISP("(x4 / see-01\n\t:ARG0 (x3 / girl\n\t\t:quant 2\n\t\t:mod (x2 / pretty))\n\t:ARG1 (x6 / boy))");
		assertEquals(amr, "(x4 (see-01 (:ARG0 (x3 (girl (:quant 2) (:mod (x2 pretty))))) (:ARG1 (x6 boy))))");
		
		String ast = t.transformToGF(amr).get(0);
		assertEquals(ast, "(mkS (mkCl (mkNP a_Quant (mkNum (mkDigits \"2\")) (mkCN pretty_A girl_N)) (mkVP see_01_V2 (mkNP a_Quant singularNum (mkCN boy_N)))))");
		
		generateBody(Thread.currentThread().getStackTrace()[1].getMethodName(), ast, true);
	}

	// The boy sees the two pretty girls.
	@Test
	public void t05_the_boy_sees_the_two_pretty_girls() {
		Transformer t = new Transformer();
		
		String amr = t.transformToLISP("(x3 / see-01\n\t:ARG0 (x2 / boy)\n\t:ARG1 (x7 / girl\n\t\t:quant 2\n\t\t:mod (x6 / pretty)))");
		assertEquals(amr, "(x3 (see-01 (:ARG0 (x2 boy)) (:ARG1 (x7 (girl (:quant 2) (:mod (x6 pretty)))))))");
		
		String ast = t.transformToGF(amr).get(0);
		assertEquals(ast, "(mkS (mkCl (mkNP a_Quant singularNum (mkCN boy_N)) (mkVP see_01_V2 (mkNP a_Quant (mkNum (mkDigits \"2\")) (mkCN pretty_A girl_N)))))");
		
		generateBody(Thread.currentThread().getStackTrace()[1].getMethodName(), ast, true);
	}

	// Girls and boys play a game.
	@Test
	public void t06_girls_and_boys_play_a_game() {
		Transformer t = new Transformer();
		
		String amr = t.transformToLISP("(x4 / play-02\n\t:ARG0 (x2 / and\n\t\t:op1 (x1 / girl)\n\t\t:op2 (x3 / boy))\n\t:ARG1 (x6 / game))");
		assertEquals(amr, "(x4 (play-02 (:ARG0 (x2 (and (:op1 (x1 girl)) (:op2 (x3 boy))))) (:ARG1 (x6 game))))");
		
		String ast = t.transformToGF(amr).get(0);
		assertEquals(ast, "(mkS (mkCl (mkNP and_Conj (mkListNP (mkNP a_Quant singularNum (mkCN girl_N)) (mkNP a_Quant singularNum (mkCN boy_N)))) (mkVP play_02_V2 (mkNP a_Quant singularNum (mkCN game_N)))))");
		
		generateBody(Thread.currentThread().getStackTrace()[1].getMethodName(), ast, true);
	}
	
	// Boys, girls and a dog play a game.
	@Test
	public void t07_boys_girls_and_a_dog_play_a_game() {
		Transformer t = new Transformer();
		
		String amr = t.transformToLISP("(x7 / play-02\n\t:ARG0 (x4 / and\n\t\t:op1 (x1 / boy)\n\t\t:op2 (x3 / girl)\n\t\t:op2 (x6 / dog))\n\t:ARG1 (x9 / game))");
		assertEquals(amr, "(x7 (play-02 (:ARG0 (x4 (and (:op1 (x1 boy)) (:op2 (x3 girl)) (:op2 (x6 dog))))) (:ARG1 (x9 game))))");
		
		String ast = t.transformToGF(amr).get(0);
		assertEquals(ast, "(mkS (mkCl (mkNP and_Conj (mkListNP (mkNP a_Quant singularNum (mkCN dog_N)) (mkListNP (mkNP a_Quant singularNum (mkCN boy_N)) (mkNP a_Quant singularNum (mkCN girl_N))))) (mkVP play_02_V2 (mkNP a_Quant singularNum (mkCN game_N)))))");
		
		generateBody(Thread.currentThread().getStackTrace()[1].getMethodName(), ast, true);
	}
	
	// Many persons live.
	@Test
	public void t08_many_persons_live() {
		Transformer t = new Transformer();
		
		String amr = t.transformToLISP("(x3 / live-01\n\t:ARG0 (x2 / person\n\t\t:quant (x1 / many)))");
		assertEquals(amr, "(x3 (live-01 (:ARG0 (x2 (person (:quant (x1 many)))))))");
		
		String ast = t.transformToGF(amr).get(0);
		assertEquals(ast, "(mkS (mkCl (mkNP many_Det (mkCN person_N)) (mkVP live_01_V)))");
		
		generateBody(Thread.currentThread().getStackTrace()[1].getMethodName(), ast, true);
	}
	
	// Some persons live in Ventspils.
	@Test
	public void t09_some_persons_live_in_Ventspils() {
		Transformer t = new Transformer();
		
		String amr = t.transformToLISP("(x3 / live-01\n\t:ARG0 (x2 / person\n\t\t:quant (x1 / some))\n\t:location (x5 / country\n\t\t:name (n / name\n\t\t\t:op1 \"Ventspils\")))");
		assertEquals(amr, "(x3 (live-01 (:ARG0 (x2 (person (:quant (x1 some))))) (:location (x5 (country (:name (n (name (:op1 \"Ventspils\")))))))))");
		
		String ast = t.transformToGF(amr).get(0);
		assertEquals(ast, "(mkS (mkCl (mkNP somePl_Det (mkCN person_N)) (mkVP (mkVP live_01_V) (S.mkAdv in_Prep (mkNP (mkPN \"Ventspils\"))))))");
		
		generateBody(Thread.currentThread().getStackTrace()[1].getMethodName(), ast, false);
	}
	
	// Many persons live in Riga.
	@Test
	public void t10_many_persons_live_in_Riga() {
		Transformer t = new Transformer();
		
		String amr = t.transformToLISP("(x3 / live-01\n\t:ARG0 (x2 / person\n\t\t:quant (x1 / many))\n\t:location (x5 / city\n\t\t:name (n / name\n\t\t\t:op1 \"Riga\")\n\t\t:wiki \"Riga\"))");
		assertEquals(amr, "(x3 (live-01 (:ARG0 (x2 (person (:quant (x1 many))))) (:location (x5 (city (:name (n (name (:op1 \"Riga\")))) (:wiki \"Riga\"))))))");
		
		String ast = t.transformToGF(amr).get(0);
		assertEquals(ast, "(mkS (mkCl (mkNP many_Det (mkCN person_N)) (mkVP (mkVP live_01_V) (S.mkAdv in_Prep (mkNP (mkPN \"Riga\"))))))");
		
		generateBody(Thread.currentThread().getStackTrace()[1].getMethodName(), ast, false);
	}
	
	// More persons live in New York. TODO: more_Det vs. more_Quant vs. (?)
	@Test
	public void t11_more_persons_live_in_New_York() {
		Transformer t = new Transformer();
		
		String amr = t.transformToLISP("(x3 / live-01\n\t:ARG0 (x2 / person\n\t\t:quant (x1 / more))\n\t:location (x5 / city\n\t\t:name (n / name\n\t\t\t:op1 \"New\"\n\t\t\t:op2 \"York\")\n\t\t:wiki \"New_York_City\"))");
		assertEquals(amr, "(x3 (live-01 (:ARG0 (x2 (person (:quant (x1 more))))) (:location (x5 (city (:name (n (name (:op1 \"New\") (:op2 \"York\")))) (:wiki \"New_York_City\"))))))");
		
		String ast = t.transformToGF(amr).get(0);
		assertEquals(ast, "(mkS (mkCl (mkNP more_Det (mkCN person_N)) (mkVP (mkVP live_01_V) (S.mkAdv in_Prep (mkNP (mkPN \"New York\"))))))");
		
		generateBody(Thread.currentThread().getStackTrace()[1].getMethodName(), ast, false);
	}
	
	// Much more persons live in New York City. TODO: much + more (?)
	@Test
	public void t12_much_more_persons_live_in_New_York_City() {
		Transformer t = new Transformer();
		
		String amr = t.transformToLISP("(x4 / live-01\n\t:ARG0 (x3 / person\n\t\t:quant (x2 / more\n\t\t\t:degree (x1 / much)))\n\t:location (x6 / city\n\t\t:name (n / name\n\t\t\t:op1 \"New\"\n\t\t\t:op2 \"York\"\n\t\t\t:op3 \"City\")))");
		assertEquals(amr, "(x4 (live-01 (:ARG0 (x3 (person (:quant (x2 (more (:degree (x1 much)))))))) (:location (x6 (city (:name (n (name (:op1 \"New\") (:op2 \"York\") (:op3 \"City\")))))))))");
		
		String ast = t.transformToGF(amr).get(0);
		assertEquals(ast, "???");
		
		//generateBody(Thread.currentThread().getStackTrace()[1].getMethodName(), ast, false);
	}

	// Few persons live in Riga and New York. 
	@Test
	public void t13_few_persons_live_in_Riga_and_New_York() {
		Transformer t = new Transformer();
		
		String amr = t.transformToLISP("(x3 / live-01\n\t:ARG0 (x2 / person\n\t\t:quant (x1 / few))\n\t:location (x6 / and\n\t\t:op1 (x5 / city\n\t\t\t:name (n / name\n\t\t\t\t:op1 \"Riga\")\n\t\t\t:wiki \"Riga\")\n\t\t:op2 (x7 / city\n\t\t\t:name (n1 / name\n\t\t\t\t:op1 \"New\"\n\t\t\t\t:op2 \"York\")\n\t\t\t:wiki \"New_York_City\")))");
		assertEquals(amr, "(x3 (live-01 (:ARG0 (x2 (person (:quant (x1 few))))) (:location (x6 (and (:op1 (x5 (city (:name (n (name (:op1 \"Riga\")))) (:wiki \"Riga\")))) (:op2 (x7 (city (:name (n1 (name (:op1 \"New\") (:op2 \"York\")))) (:wiki \"New_York_City\")))))))))");
		
		String ast = t.transformToGF(amr).get(0);
		assertEquals(ast, "(mkS (mkCl (mkNP few_Det (mkCN person_N)) (mkVP (mkVP live_01_V) (S.mkAdv in_Prep (mkNP and_Conj (mkListNP (mkNP (mkPN \"Riga\")) (mkNP (mkPN \"New York\"))))))))");
		
		generateBody(Thread.currentThread().getStackTrace()[1].getMethodName(), ast, false);
	}
	
	// Boys and girls play games in Riga.
	@Test
	public void t14_boys_and_girls_play_games_in_Riga() {
		Transformer t = new Transformer();
		
		String amr = t.transformToLISP("(x4 / play-02\n\t:ARG0 (x2 / and\n\t\t:op1 (x1 / boy)\n\t\t:op2 (x3 / girl))\n\t:ARG1 (x5 / game)\n\t:location (x7 / city\n\t\t:name (n / name\n\t\t\t:op1 \"Riga\")\n\t\t:wiki \"Riga\"))");
		assertEquals(amr, "(x4 (play-02 (:ARG0 (x2 (and (:op1 (x1 boy)) (:op2 (x3 girl))))) (:ARG1 (x5 game)) (:location (x7 (city (:name (n (name (:op1 \"Riga\")))) (:wiki \"Riga\"))))))");
		
		String ast = t.transformToGF(amr).get(0);
		assertEquals(ast, "(mkS (mkCl (mkNP and_Conj (mkListNP (mkNP a_Quant singularNum (mkCN boy_N)) (mkNP a_Quant singularNum (mkCN girl_N)))) (mkVP (mkVP play_02_V2 (mkNP a_Quant singularNum (mkCN game_N))) (S.mkAdv in_Prep (mkNP (mkPN \"Riga\"))))))");
		
		generateBody(Thread.currentThread().getStackTrace()[1].getMethodName(), ast, false);
	}
	
	// Boys and girls play games in Riga and New York.
	// FIXME: CAMR
	@Test
	public void t15_boys_and_girls_play_games_in_Riga_and_New_York() {
		Transformer t = new Transformer();
		
		String amr = t.transformToLISP("(x4 / play-02 :ARG0 (x2 / and :op1 (x1 / boy) :op2 (x3 / girl)) :ARG1 (x5 / game) :location (x8 / and :op1 (x7 / city :name (n / name :op1 \"Riga\") :wiki \"Riga\") :op2 (x9 / city :name (n1 / name :op1 \"New\" :op2 \"York\") :wiki \"New_York_City\")))");
		assertEquals(amr, "(x4 (play-02 (:ARG0 (x2 (and (:op1 (x1 boy)) (:op2 (x3 girl))))) (:ARG1 (x5 game)) (:location (x8 (and (:op1 (x7 (city (:name (n (name (:op1 \"Riga\")))) (:wiki \"Riga\")))) (:op2 (x9 (city (:name (n1 (name (:op1 \"New\") (:op2 \"York\")))) (:wiki \"New_York_City\")))))))))");
		
		String ast = t.transformToGF(amr).get(0);
		assertEquals(ast, "(mkS (mkCl (mkNP and_Conj (mkListNP (mkNP a_Quant singularNum (mkCN boy_N)) (mkNP a_Quant singularNum (mkCN girl_N)))) (mkVP (mkVP play_02_V2 (mkNP a_Quant singularNum (mkCN game_N))) (S.mkAdv in_Prep (mkNP and_Conj (mkListNP (mkNP (mkPN \"Riga\")) (mkNP (mkPN \"New York\"))))))))");
		
		generateBody(Thread.currentThread().getStackTrace()[1].getMethodName(), ast, false);
	}

	// Boys see Ann.
	@Test
	public void t16_boys_see_Ann() {
		Transformer t = new Transformer();
			
		String amr = t.transformToLISP("(x2 / see-01\n\t:ARG0 (x1 / boy)\n\t:ARG1 (x3 / person\n\t\t:name (n / name\n\t\t\t:op1 \"Ann\")))");
		assertEquals(amr, "(x2 (see-01 (:ARG0 (x1 boy)) (:ARG1 (x3 (person (:name (n (name (:op1 \"Ann\")))))))))");
			
		String ast = t.transformToGF(amr).get(0);
		assertEquals(ast, "(mkS (mkCl (mkNP a_Quant singularNum (mkCN boy_N)) (mkVP see_01_V2 (mkNP (mkPN \"Ann\")))))");
		
		generateBody(Thread.currentThread().getStackTrace()[1].getMethodName(), ast, false);
	}

	// John plays a game.
	// FIXME: wiki
	@Test
	public void t17_John_plays_a_game() {
		Transformer t = new Transformer();
			
		String amr = t.transformToLISP("(x2 / play-02\n\t:ARG0 (x1 / person\n\t\t:name (n / name\n\t\t\t:op1 \"John\")\n\t\t:wiki \"-\")\n\t:ARG1 (x4 / game))");
		assertEquals(amr, "(x2 (play-02 (:ARG0 (x1 (person (:name (n (name (:op1 \"John\")))) (:wiki \"-\")))) (:ARG1 (x4 game))))");
			
		String ast = t.transformToGF(amr).get(0);
		assertEquals(ast, "(mkS (mkCl (mkNP (mkPN \"John\")) (mkVP play_02_V2 (mkNP a_Quant singularNum (mkCN game_N)))))");
		
		generateBody(Thread.currentThread().getStackTrace()[1].getMethodName(), ast, false);
	}

	// John sees Ann.
	// FIXME: wiki
	@Test
	public void t18_John_sees_Ann() {
		Transformer t = new Transformer();
			
		String amr = t.transformToLISP("(x2 / see-01\n\t:ARG0 (x1 / person\n\t\t:name (n / name\n\t\t\t:op1 \"John\")\n\t\t:wiki \"-\")\n\t:ARG1 (x3 / person\n\t\t:name (n1 / name\n\t\t\t:op1 \"Ann\")))");
		assertEquals(amr, "(x2 (see-01 (:ARG0 (x1 (person (:name (n (name (:op1 \"John\")))) (:wiki \"-\")))) (:ARG1 (x3 (person (:name (n1 (name (:op1 \"Ann\")))))))))");
			
		String ast = t.transformToGF(amr).get(0);
		assertEquals(ast, "(mkS (mkCl (mkNP (mkPN \"John\")) (mkVP see_01_V2 (mkNP (mkPN \"Ann\")))))");
		
		generateBody(Thread.currentThread().getStackTrace()[1].getMethodName(), ast, false);
	}
	
	// Girls see some boys who play a game.
	@Test
	public void t19_girls_see_some_boys_who_play_a_game() {
		Transformer t = new Transformer();
			
		String amr = t.transformToLISP("(x2 / see-01\n\t:ARG0 (x1 / girl)\n\t:ARG1 (x4 / boy\n\t\t:quant (x3 / some)\n\t\t:ARG0-of (x6 / play-02\n\t\t\t:ARG1 (x8 / game))))");
		assertEquals(amr, "(x2 (see-01 (:ARG0 (x1 girl)) (:ARG1 (x4 (boy (:quant (x3 some)) (:ARG0-of (x6 (play-02 (:ARG1 (x8 game))))))))))");
			
		String ast = t.transformToGF(amr).get(0);
		assertEquals(ast, "(mkS (mkCl (mkNP a_Quant singularNum (mkCN girl_N)) (mkVP see_01_V2 (mkNP somePl_Det (mkCN (mkCN boy_N) (mkRS (mkRCl which_RP (mkVP play_02_V2 (mkNP a_Quant singularNum (mkCN game_N))))))))))");
		
		generateBody(Thread.currentThread().getStackTrace()[1].getMethodName(), ast, true);
	}
	
	// Girls see some pretty boys who play a ball game.
	// FIXME: ':mod A' ("pretty boys") vs. ':mod N' ("ball game")
	@Test
	public void t20_girls_see_some_pretty_boys_who_play_a_ball_game() {
		Transformer t = new Transformer();
				
		String amr = t.transformToLISP("(x2 / see-01\n\t:ARG0 (x1 / girl)\n\t:ARG1 (x5 / boy\n\t\t:quant (x3 / some)\n\t\t:mod (x4 / pretty)\n\t\t:ARG0-of (x7 / play-02\n\t\t\t:ARG1 (x10 / game\n\t\t\t\t:mod (x9 / ball)))))");
		assertEquals(amr, "(x2 (see-01 (:ARG0 (x1 girl)) (:ARG1 (x5 (boy (:quant (x3 some)) (:mod (x4 pretty)) (:ARG0-of (x7 (play-02 (:ARG1 (x10 (game (:mod (x9 ball)))))))))))))");
				
		String ast = t.transformToGF(amr).get(0);
		assertEquals(ast, "(mkS (mkCl (mkNP a_Quant singularNum (mkCN girl_N)) (mkVP see_01_V2 (mkNP somePl_Det (mkCN (mkCN pretty_A boy_N) (mkRS (mkRCl which_RP (mkVP play_02_V2 (mkNP a_Quant singularNum (mkCN ball_A game_N))))))))))");
		
		generateBody(Thread.currentThread().getStackTrace()[1].getMethodName(), ast, true);
	}
	
	// Girls who see the game like the boys who play.
	// FIXME: "A girl who sees the game likes the boys who play." (CAMR)
	@Test
	public void t21_girls_who_see_the_game_like_the_boys_who_play() {
		Transformer t = new Transformer();
				
		String amr = t.transformToLISP("(x6 / like-01\n\t:ARG0 (x1 / girl\n\t\t:ARG0-of (x3 / see-01\n\t\t\t:ARG1 (x5 / game)))\n\t:ARG1 (x8 / boy\n\t\t:ARG0-of (x10 / play-02)))");
		assertEquals(amr, "(x6 (like-01 (:ARG0 (x1 (girl (:ARG0-of (x3 (see-01 (:ARG1 (x5 game)))))))) (:ARG1 (x8 (boy (:ARG0-of (x10 play-02)))))))");
				
		String ast = t.transformToGF(amr).get(0);
		assertEquals(ast, "(mkS (mkCl (mkNP a_Quant singularNum (mkCN (mkCN girl_N) (mkRS (mkRCl which_RP (mkVP see_01_V2 (mkNP a_Quant singularNum (mkCN game_N))))))) (mkVP like_01_V2 (mkNP a_Quant singularNum (mkCN (mkCN boy_N) (mkRS (mkRCl which_RP (mkVP play_02_V))))))))");
		
		generateBody(Thread.currentThread().getStackTrace()[1].getMethodName(), ast, true);
	}
	
	// Assad spoke about the city.
	// TODO: "Assad gave a speech about the city.": give-01 vs. speak-01 / speech vs. speak-01 (CAMR?)
	// TODO: Asma_al-Assad vs. Bashar_al-Assad (wiki)
	@Test
	public void t22_Assad_spoke_about_the_city() {
		Transformer t = new Transformer();
				
		String amr = t.transformToLISP("(x2 / speak-01\n\t:ARG0 (x1 / person\n\t\t:name (n / name\n\t\t\t:op1 \"Assad\")\n\t\t:wiki \"Asma_al-Assad\")\n\t:topic (x4 / city))");
		assertEquals(amr, "(x2 (speak-01 (:ARG0 (x1 (person (:name (n (name (:op1 \"Assad\")))) (:wiki \"Asma_al-Assad\")))) (:topic (x4 city))))");
					
		String ast = t.transformToGF(amr).get(0);
		assertEquals(ast, "(mkS (mkCl (mkNP (mkPN \"Assad\")) (mkVP (mkVP speak_01_V) (S.mkAdv about_Prep (mkNP a_Quant singularNum (mkCN city_N))))))");
			
		generateBody(Thread.currentThread().getStackTrace()[1].getMethodName(), ast, false);
	}
	
	// Assad spoke about the two cities.
	// FIXME: CAMR
	@Test
	public void t23_Assad_spoke_about_the_two_cities() {
		Transformer t = new Transformer();
					
		String amr = t.transformToLISP("(x2 / speak-01\n\t:ARG0 (x1 / person\n\t\t:name (n / name\n\t\t\t:op1 \"Assad\")\n\t\t:wiki \"Asma_al-Assad\")\n\t:topic (x4 / city :quant 2))");
		assertEquals(amr, "(x2 (speak-01 (:ARG0 (x1 (person (:name (n (name (:op1 \"Assad\")))) (:wiki \"Asma_al-Assad\")))) (:topic (x4 (city (:quant 2))))))");
						
		String ast = t.transformToGF(amr).get(0);
		assertEquals(ast, "(mkS (mkCl (mkNP (mkPN \"Assad\")) (mkVP (mkVP speak_01_V) (S.mkAdv about_Prep (mkNP a_Quant (mkNum (mkDigits \"2\")) (mkCN city_N))))))");
				
		generateBody(Thread.currentThread().getStackTrace()[1].getMethodName(), ast, false);
	}
	
	// Assad spoke a word about the city.
	@Test
	public void t24_Assad_spoke_a_word_about_the_city() {
		Transformer t = new Transformer();
					
		String amr = t.transformToLISP("(x2 / speak-01\n\t:ARG0 (x1 / person\n\t\t:name (n / name\n\t\t\t:op1 \"Assad\")\n\t\t:wiki \"Asma_al-Assad\")\n\t:ARG1 (x4 / word\n\t\t:topic (x7 / city)))");
		assertEquals(amr, "(x2 (speak-01 (:ARG0 (x1 (person (:name (n (name (:op1 \"Assad\")))) (:wiki \"Asma_al-Assad\")))) (:ARG1 (x4 (word (:topic (x7 city)))))))");
							
		String ast = t.transformToGF(amr).get(0);
		assertEquals(ast, "(mkS (mkCl (mkNP (mkPN \"Assad\")) (mkVP speak_01_V2 (mkNP (mkNP a_Quant singularNum (mkCN word_N)) (S.mkAdv about_Prep (mkNP a_Quant singularNum (mkCN city_N)))))))");
					
		generateBody(Thread.currentThread().getStackTrace()[1].getMethodName(), ast, false);
	}
	
	// The boy is a person.
	@Test
	public void t25_the_boy_is_a_person() {
		Transformer t = new Transformer();
						
		String amr = t.transformToLISP("(x5 / person\n\t:domain (x2 / boy))");
		assertEquals(amr, "(x5 (person (:domain (x2 boy))))");
								
		String ast = t.transformToGF(amr).get(0);
		assertEquals(ast, "(mkS (mkCl (mkNP a_Quant singularNum (mkCN boy_N)) (mkNP a_Quant singularNum (mkCN person_N))))");
						
		generateBody(Thread.currentThread().getStackTrace()[1].getMethodName(), ast, true);
	}
	
	// Iceland is a very interesting example.
	@Test
	public void t26_Iceland_is_a_very_interesting_example() {
		Transformer t = new Transformer();
						
		String amr = t.transformToLISP("(e / example :ARG2-of (i / interest-01 :degree (v / very)) :domain (c / country :wiki \"Iceland\" :name (n / name :op1 \"Iceland\")))");
		assertEquals(amr, "(e (example (:ARG2-of (i (interest-01 (:degree (v very))))) (:domain (c (country (:wiki \"Iceland\") (:name (n (name (:op1 \"Iceland\")))))))))");
								
		String ast = t.transformToGF(amr).get(0);
		assertEquals(ast, "(mkS (mkCl (mkNP (mkPN \"Iceland\")) (mkNP a_Quant singularNum (mkCN (mkCN example_N) (mkRS (mkRCl which_RP (mkAP very_AdA (mkAP interesting_A))))))))");
						
		generateBody(Thread.currentThread().getStackTrace()[1].getMethodName(), ast, false);
	}
		
}
