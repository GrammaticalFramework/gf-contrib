package org.grammaticalframework.amr.tregex;

import static org.junit.Assert.assertEquals;

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
 *
 * Running the test suite also produces a compilable GF grammar for testing the partially
 * multilingual linearizations.
 */
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class Tester {

    public static final String name = "TestTrees";
    public static final String path = "out/tests/" + name;
    public static final String rules = "../rules/amr2api.tsurgeon";
    public static final String roles = "../lexicons/propbank/frames-roles.txt";

    @BeforeClass
    public static void generateHeader() {
        try {
            PrintWriter abs = new PrintWriter(new FileWriter(path + ".gf"));
            PrintWriter eng = new PrintWriter(new FileWriter(path + "Eng.gf"));
            PrintWriter lav = new PrintWriter(new FileWriter(path + "Lav.gf"));
            PrintWriter rus = new PrintWriter(new FileWriter(path + "Rus.gf"));
            PrintWriter gfs = new PrintWriter(new FileWriter(path + ".gfs"));

            abs.println("abstract " + name + " = TestLexicon ** {");
            abs.println("\n\tflags startcat = Text ;\n");

            eng.println("--# -path=.:alltenses:../../../lexicons/translator:../semeval\n");
            eng.println("concrete " + name + "Eng of " + name + " = TestLexiconEng **");
            eng.println(
                    "open SyntaxEng, (S=SyntaxEng), (E=ExtraEng), (L=TestLexiconEng), (P=ParadigmsEng), ConstructionEng, Prelude in {");
            eng.println("\n\tflags\n\t\tcoding = utf8 ;\n\t\tlanguage = en_US ;\n");

            lav.println("--# -path=.:alltenses:../../../lexicons/translator:../semeval\n");
            lav.println("concrete " + name + "Lav of " + name + " = TestLexiconLav **");
            lav.println(
                    "open SyntaxLav, (S=SyntaxLav), (E=ExtraLav), (L=TestLexiconLav), (P=ParadigmsLav), Prelude in {");
            lav.println("\n\tflags\n\t\tcoding = utf8 ;\n\t\tlanguage = lv_LV ;\n");

            rus.println("--# -path=.:alltenses:../../../lexicons/translator:../semeval\n");
            rus.println("concrete " + name + "Rus of " + name + " = TestLexiconRus **");
            rus.println(
                    "open SyntaxRus, (S=SyntaxRus), (E=ExtraRus), (L=TestLexiconRus), (P=ParadigmsRus), Prelude in {");
            rus.println("\n\tflags\n\t\tcoding = utf8 ;\n\t\tlanguage = ru_RU ;\n");

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

            abs.println("\tfun " + fun + " : Text ;");
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
        Transformer t = new Transformer(rules, roles, false);

        String amr = t.transformToLISP(
                "(x2 / see-01\n\t:ARG0 (x1 / girl)\n\t:ARG1 (x4 / boy))");
        assertEquals(amr,
                "(x2 (see-01 (:ARG0 (x1 girl)) (:ARG1 (x4 boy))))");

        String ast = t.transformToGF(amr).get(0);
        assertEquals(ast,
                "(mkText (mkUtt (mkS (mkCl (mkNP S.a_Quant (mkCN L.girl_N)) (mkVP L.see_V2 (mkNP S.a_Quant (mkCN L.boy_N)))))) fullStopPunct)");

        generateBody(Thread.currentThread().getStackTrace()[1].getMethodName(), ast, true);
    }

    // The boy is seen by the girls.
    @Test
    public void t02_the_boy_is_seen_by_the_girls() {
        Transformer t = new Transformer(rules, roles, false);

        String amr = t.transformToLISP(
                "(x4 / see-01\n\t:ARG1 (x2 / boy)\n\t:ARG0 (x7 / girl))");
        assertEquals(amr,
                "(x4 (see-01 (:ARG1 (x2 boy)) (:ARG0 (x7 girl))))");

        String ast = t.transformToGF(amr).get(0);
        assertEquals(ast,
                "(mkText (mkUtt (mkS (mkCl (mkNP S.a_Quant (mkCN L.girl_N)) (mkVP L.see_V2 (mkNP S.a_Quant (mkCN L.boy_N)))))) fullStopPunct)");

        generateBody(Thread.currentThread().getStackTrace()[1].getMethodName(), ast, true);
    }

    // Two girls see a boy.
    @Test
    public void t03_two_girls_see_a_boy() {
        Transformer t = new Transformer(rules, roles, false);

        String amr = t.transformToLISP(
                "(x3 / see-01\n\t:ARG0 (x2 / girl\n\t\t:quant 2)\n\t:ARG1 (x5 / boy))");
        assertEquals(amr,
                "(x3 (see-01 (:ARG0 (x2 (girl (:quant 2)))) (:ARG1 (x5 boy))))");

        String ast = t.transformToGF(amr).get(0);
        assertEquals(ast,
                "(mkText (mkUtt (mkS (mkCl (mkNP S.a_Quant (mkNum (mkDigits \"2\")) (mkCN L.girl_N)) (mkVP L.see_V2 (mkNP S.a_Quant (mkCN L.boy_N)))))) fullStopPunct)");

        generateBody(Thread.currentThread().getStackTrace()[1].getMethodName(), ast, true);
    }

    // Two pretty girls see a boy.
    @Test
    public void t04_two_pretty_girls_see_a_boy() {
        Transformer t = new Transformer(rules, roles, false);

        String amr = t.transformToLISP(
                "(x4 / see-01\n\t:ARG0 (x3 / girl\n\t\t:quant 2\n\t\t:mod (x2 / pretty))\n\t:ARG1 (x6 / boy))");
        assertEquals(amr,
                "(x4 (see-01 (:ARG0 (x3 (girl (:quant 2) (:mod (x2 pretty))))) (:ARG1 (x6 boy))))");

        String ast = t.transformToGF(amr).get(0);
        assertEquals(ast,
                "(mkText (mkUtt (mkS (mkCl (mkNP S.a_Quant (mkNum (mkDigits \"2\")) (mkCN L.pretty_A L.girl_N)) (mkVP L.see_V2 (mkNP S.a_Quant (mkCN L.boy_N)))))) fullStopPunct)");

        generateBody(Thread.currentThread().getStackTrace()[1].getMethodName(), ast, true);
    }

    // The boy sees the two pretty girls.
    @Test
    public void t05_the_boy_sees_the_two_pretty_girls() {
        Transformer t = new Transformer(rules, roles, false);

        String amr = t.transformToLISP(
                "(x3 / see-01\n\t:ARG0 (x2 / boy)\n\t:ARG1 (x7 / girl\n\t\t:quant 2\n\t\t:mod (x6 / pretty)))");
        assertEquals(amr,
                "(x3 (see-01 (:ARG0 (x2 boy)) (:ARG1 (x7 (girl (:quant 2) (:mod (x6 pretty)))))))");

        String ast = t.transformToGF(amr).get(0);
        assertEquals(ast,
                "(mkText (mkUtt (mkS (mkCl (mkNP S.a_Quant (mkCN L.boy_N)) (mkVP L.see_V2 (mkNP S.a_Quant (mkNum (mkDigits \"2\")) (mkCN L.pretty_A L.girl_N)))))) fullStopPunct)");

        generateBody(Thread.currentThread().getStackTrace()[1].getMethodName(), ast, true);
    }

    // Girls and boys play a game.
    @Test
    public void t06_girls_and_boys_play_a_game() {
        Transformer t = new Transformer(rules, roles, false);

        String amr = t.transformToLISP(
                "(x4 / play-02\n\t:ARG0 (x2 / and\n\t\t:op1 (x1 / girl)\n\t\t:op2 (x3 / boy))\n\t:ARG1 (x6 / game))");
        assertEquals(amr,
                "(x4 (play-02 (:ARG0 (x2 (and (:op1 (x1 girl)) (:op2 (x3 boy))))) (:ARG1 (x6 game))))");

        String ast = t.transformToGF(amr).get(0);
        assertEquals(ast,
                "(mkText (mkUtt (mkS (mkCl (mkNP S.and_Conj (mkListNP (mkNP S.a_Quant (mkCN L.girl_N)) (mkNP S.a_Quant (mkCN L.boy_N)))) (mkVP L.play_V2 (mkNP S.a_Quant (mkCN L.game_N)))))) fullStopPunct)");

        generateBody(Thread.currentThread().getStackTrace()[1].getMethodName(), ast, true);
    }

    // Boys, girls and a dog play a game.
    @Test
    public void t07_boys_girls_and_a_dog_play_a_game() {
        Transformer t = new Transformer(rules, roles, false);

        String amr = t.transformToLISP(
                "(x7 / play-02\n\t:ARG0 (x4 / and\n\t\t:op1 (x1 / boy)\n\t\t:op2 (x3 / girl)\n\t\t:op2 (x6 / dog))\n\t:ARG1 (x9 / game))");
        assertEquals(amr,
                "(x7 (play-02 (:ARG0 (x4 (and (:op1 (x1 boy)) (:op2 (x3 girl)) (:op2 (x6 dog))))) (:ARG1 (x9 game))))");

        String ast = t.transformToGF(amr).get(0);
        assertEquals(ast,
                "(mkText (mkUtt (mkS (mkCl (mkNP S.and_Conj (mkListNP (mkNP S.a_Quant (mkCN L.dog_N)) (mkListNP (mkNP S.a_Quant (mkCN L.boy_N)) (mkNP S.a_Quant (mkCN L.girl_N))))) (mkVP L.play_V2 (mkNP S.a_Quant (mkCN L.game_N)))))) fullStopPunct)");

        generateBody(Thread.currentThread().getStackTrace()[1].getMethodName(), ast, true);
    }

    // Many persons live.
    @Test
    public void t08_many_persons_live() {
        Transformer t = new Transformer(rules, roles, false);

        String amr = t.transformToLISP(
                "(x3 / live-01\n\t:ARG0 (x2 / person\n\t\t:quant (x1 / many)))");
        assertEquals(amr,
                "(x3 (live-01 (:ARG0 (x2 (person (:quant (x1 many)))))))");

        String ast = t.transformToGF(amr).get(0);
        assertEquals(ast,
                "(mkText (mkUtt (mkS (mkCl (mkNP S.many_Det (mkCN L.person_N)) (mkVP L.live_V)))) fullStopPunct)");

        generateBody(Thread.currentThread().getStackTrace()[1].getMethodName(), ast, true);
    }

    // Some persons live in Ventspils.
    @Test
    public void t09_some_persons_live_in_Ventspils() {
        Transformer t = new Transformer(rules, roles, false);

        String amr = t.transformToLISP(
                "(x3 / live-01\n\t:ARG0 (x2 / person\n\t\t:quant (x1 / some))\n\t:location (x5 / country\n\t\t:name (n / name\n\t\t\t:op1 \"Ventspils\")))");
        assertEquals(amr,
                "(x3 (live-01 (:ARG0 (x2 (person (:quant (x1 some))))) (:location (x5 (country (:name (n (name (:op1 \"Ventspils\")))))))))");

        String ast = t.transformToGF(amr).get(0);
        assertEquals(ast,
                "(mkText (mkUtt (mkS (mkCl (mkNP S.somePl_Det (mkCN L.person_N)) (mkVP (mkVP L.live_V) (S.mkAdv L.in_Prep (mkNP (P.mkPN \"Ventspils\"))))))) fullStopPunct)");

        generateBody(Thread.currentThread().getStackTrace()[1].getMethodName(), ast, false);
    }

    // Many persons live in Riga.
    @Test
    public void t10_many_persons_live_in_Riga() {
        Transformer t = new Transformer(rules, roles, false);

        String amr = t.transformToLISP(
                "(x3 / live-01\n\t:ARG0 (x2 / person\n\t\t:quant (x1 / many))\n\t:location (x5 / city\n\t\t:name (n / name\n\t\t\t:op1 \"Riga\")\n\t\t:wiki \"Riga\"))");
        assertEquals(amr,
                "(x3 (live-01 (:ARG0 (x2 (person (:quant (x1 many))))) (:location (x5 (city (:name (n (name (:op1 \"Riga\")))) (:wiki \"Riga\"))))))");

        String ast = t.transformToGF(amr).get(0);
        assertEquals(ast,
                "(mkText (mkUtt (mkS (mkCl (mkNP S.many_Det (mkCN L.person_N)) (mkVP (mkVP L.live_V) (S.mkAdv L.in_Prep (mkNP (P.mkPN \"Riga\"))))))) fullStopPunct)");

        generateBody(Thread.currentThread().getStackTrace()[1].getMethodName(), ast, false);
    }

    // More persons live in New York.
    @Test
    public void t11_more_persons_live_in_New_York() {
        Transformer t = new Transformer(rules, roles, false);

        String amr = t.transformToLISP(
                "(x3 / live-01\n\t:ARG0 (x2 / person\n\t\t:quant (x1 / more))\n\t:location (x5 / city\n\t\t:name (n / name\n\t\t\t:op1 \"New\"\n\t\t\t:op2 \"York\")\n\t\t:wiki \"New_York_City\"))");
        assertEquals(amr,
                "(x3 (live-01 (:ARG0 (x2 (person (:quant (x1 more))))) (:location (x5 (city (:name (n (name (:op1 \"New\") (:op2 \"York\")))) (:wiki \"New_York_City\"))))))");

        String ast = t.transformToGF(amr).get(0);
        assertEquals(ast,
                "(mkText (mkUtt (mkS (mkCl (mkNP L.more_Det (mkCN L.person_N)) (mkVP (mkVP L.live_V) (S.mkAdv L.in_Prep (mkNP (P.mkPN \"New York\"))))))) fullStopPunct)");

        generateBody(Thread.currentThread().getStackTrace()[1].getMethodName(), ast, false);
    }

    // Much more persons live in New York City.
    // TODO: How to represent much + more in GF? much_Predet?!
    @Test
    public void t12_much_more_persons_live_in_New_York_City() {
        Transformer t = new Transformer(rules, roles, false);

        String amr = t.transformToLISP(
                "(x4 / live-01\n\t:ARG0 (x3 / person\n\t\t:quant (x2 / more\n\t\t\t:degree (x1 / much)))\n\t:location (x6 / city\n\t\t:name (n / name\n\t\t\t:op1 \"New\"\n\t\t\t:op2 \"York\"\n\t\t\t:op3 \"City\")))");
        assertEquals(amr,
                "(x4 (live-01 (:ARG0 (x3 (person (:quant (x2 (more (:degree (x1 much)))))))) (:location (x6 (city (:name (n (name (:op1 \"New\") (:op2 \"York\") (:op3 \"City\")))))))))");

        String ast = t.transformToGF(amr).get(0);
        assertEquals(ast,
                "???");

        // generateBody(Thread.currentThread().getStackTrace()[1].getMethodName(), ast, false);
    }

    // Few persons live in Riga and New York.
    @Test
    public void t13_few_persons_live_in_Riga_and_New_York() {
        Transformer t = new Transformer(rules, roles, false);

        String amr = t.transformToLISP(
                "(x3 / live-01\n\t:ARG0 (x2 / person\n\t\t:quant (x1 / few))\n\t:location (x6 / and\n\t\t:op1 (x5 / city\n\t\t\t:name (n / name\n\t\t\t\t:op1 \"Riga\")\n\t\t\t:wiki \"Riga\")\n\t\t:op2 (x7 / city\n\t\t\t:name (n1 / name\n\t\t\t\t:op1 \"New\"\n\t\t\t\t:op2 \"York\")\n\t\t\t:wiki \"New_York_City\")))");
        assertEquals(amr,
                "(x3 (live-01 (:ARG0 (x2 (person (:quant (x1 few))))) (:location (x6 (and (:op1 (x5 (city (:name (n (name (:op1 \"Riga\")))) (:wiki \"Riga\")))) (:op2 (x7 (city (:name (n1 (name (:op1 \"New\") (:op2 \"York\")))) (:wiki \"New_York_City\")))))))))");

        String ast = t.transformToGF(amr).get(0);
        assertEquals(ast,
                "(mkText (mkUtt (mkS (mkCl (mkNP S.few_Det (mkCN L.person_N)) (mkVP (mkVP L.live_V) (S.mkAdv L.in_Prep (mkNP S.and_Conj (mkListNP (mkNP (P.mkPN \"Riga\")) (mkNP (P.mkPN \"New York\"))))))))) fullStopPunct)");

        generateBody(Thread.currentThread().getStackTrace()[1].getMethodName(), ast, false);
    }

    // Boys and girls play games in Riga.
    @Test
    public void t14_boys_and_girls_play_games_in_Riga() {
        Transformer t = new Transformer(rules, roles, false);

        String amr = t.transformToLISP(
                "(x4 / play-02\n\t:ARG0 (x2 / and\n\t\t:op1 (x1 / boy)\n\t\t:op2 (x3 / girl))\n\t:ARG1 (x5 / game)\n\t:location (x7 / city\n\t\t:name (n / name\n\t\t\t:op1 \"Riga\")\n\t\t:wiki \"Riga\"))");
        assertEquals(amr,
                "(x4 (play-02 (:ARG0 (x2 (and (:op1 (x1 boy)) (:op2 (x3 girl))))) (:ARG1 (x5 game)) (:location (x7 (city (:name (n (name (:op1 \"Riga\")))) (:wiki \"Riga\"))))))");

        String ast = t.transformToGF(amr).get(0);
        assertEquals(ast,
                "(mkText (mkUtt (mkS (mkCl (mkNP S.and_Conj (mkListNP (mkNP S.a_Quant (mkCN L.boy_N)) (mkNP S.a_Quant (mkCN L.girl_N)))) (mkVP (mkVP L.play_V2 (mkNP S.a_Quant (mkCN L.game_N))) (S.mkAdv L.in_Prep (mkNP (P.mkPN \"Riga\"))))))) fullStopPunct)");

        generateBody(Thread.currentThread().getStackTrace()[1].getMethodName(), ast, false);
    }

    // Boys and girls play games in Riga and New York.
    // FIXME: CAMR
    @Test
    public void t15_boys_and_girls_play_games_in_Riga_and_New_York() {
        Transformer t = new Transformer(rules, roles, false);

        String amr = t.transformToLISP(
                "(x4 / play-02 :ARG0 (x2 / and :op1 (x1 / boy) :op2 (x3 / girl)) :ARG1 (x5 / game) :location (x8 / and :op1 (x7 / city :name (n / name :op1 \"Riga\") :wiki \"Riga\") :op2 (x9 / city :name (n1 / name :op1 \"New\" :op2 \"York\") :wiki \"New_York_City\")))");
        assertEquals(amr,
                "(x4 (play-02 (:ARG0 (x2 (and (:op1 (x1 boy)) (:op2 (x3 girl))))) (:ARG1 (x5 game)) (:location (x8 (and (:op1 (x7 (city (:name (n (name (:op1 \"Riga\")))) (:wiki \"Riga\")))) (:op2 (x9 (city (:name (n1 (name (:op1 \"New\") (:op2 \"York\")))) (:wiki \"New_York_City\")))))))))");

        String ast = t.transformToGF(amr).get(0);
        assertEquals(ast,
                "(mkText (mkUtt (mkS (mkCl (mkNP S.and_Conj (mkListNP (mkNP S.a_Quant (mkCN L.boy_N)) (mkNP S.a_Quant (mkCN L.girl_N)))) (mkVP (mkVP L.play_V2 (mkNP S.a_Quant (mkCN L.game_N))) (S.mkAdv L.in_Prep (mkNP S.and_Conj (mkListNP (mkNP (P.mkPN \"Riga\")) (mkNP (P.mkPN \"New York\"))))))))) fullStopPunct)");

        generateBody(Thread.currentThread().getStackTrace()[1].getMethodName(), ast, false);
    }

    // Boys see Ann.
    @Test
    public void t16_boys_see_Ann() {
        Transformer t = new Transformer(rules, roles, false);

        String amr = t.transformToLISP(
                "(x2 / see-01\n\t:ARG0 (x1 / boy)\n\t:ARG1 (x3 / person\n\t\t:name (n / name\n\t\t\t:op1 \"Ann\")))");
        assertEquals(amr,
                "(x2 (see-01 (:ARG0 (x1 boy)) (:ARG1 (x3 (person (:name (n (name (:op1 \"Ann\")))))))))");

        String ast = t.transformToGF(amr).get(0);
        assertEquals(ast,
                "(mkText (mkUtt (mkS (mkCl (mkNP S.a_Quant (mkCN L.boy_N)) (mkVP L.see_V2 (mkNP (P.mkPN \"Ann\")))))) fullStopPunct)");

        generateBody(Thread.currentThread().getStackTrace()[1].getMethodName(), ast, false);
    }

    // John plays a game.
    // FIXME: wiki
    @Test
    public void t17_John_plays_a_game() {
        Transformer t = new Transformer(rules, roles, false);

        String amr = t.transformToLISP(
                "(x2 / play-02\n\t:ARG0 (x1 / person\n\t\t:name (n / name\n\t\t\t:op1 \"John\")\n\t\t:wiki \"-\")\n\t:ARG1 (x4 / game))");
        assertEquals(amr,
                "(x2 (play-02 (:ARG0 (x1 (person (:name (n (name (:op1 \"John\")))) (:wiki \"-\")))) (:ARG1 (x4 game))))");

        String ast = t.transformToGF(amr).get(0);
        assertEquals(ast,
                "(mkText (mkUtt (mkS (mkCl (mkNP (P.mkPN \"John\")) (mkVP L.play_V2 (mkNP S.a_Quant (mkCN L.game_N)))))) fullStopPunct)");

        generateBody(Thread.currentThread().getStackTrace()[1].getMethodName(), ast, false);
    }

    // John sees Ann.
    // FIXME: wiki
    @Test
    public void t18_John_sees_Ann() {
        Transformer t = new Transformer(rules, roles, false);

        String amr = t.transformToLISP(
                "(x2 / see-01\n\t:ARG0 (x1 / person\n\t\t:name (n / name\n\t\t\t:op1 \"John\")\n\t\t:wiki \"-\")\n\t:ARG1 (x3 / person\n\t\t:name (n1 / name\n\t\t\t:op1 \"Ann\")))");
        assertEquals(amr,
                "(x2 (see-01 (:ARG0 (x1 (person (:name (n (name (:op1 \"John\")))) (:wiki \"-\")))) (:ARG1 (x3 (person (:name (n1 (name (:op1 \"Ann\")))))))))");

        String ast = t.transformToGF(amr).get(0);
        assertEquals(ast,
                "(mkText (mkUtt (mkS (mkCl (mkNP (P.mkPN \"John\")) (mkVP L.see_V2 (mkNP (P.mkPN \"Ann\")))))) fullStopPunct)");

        generateBody(Thread.currentThread().getStackTrace()[1].getMethodName(), ast, false);
    }

    // Girls see some boys who play a game.
    @Test
    public void t19_girls_see_some_boys_who_play_a_game() {
        Transformer t = new Transformer(rules, roles, false);

        String amr = t.transformToLISP(
                "(x2 / see-01\n\t:ARG0 (x1 / girl)\n\t:ARG1 (x4 / boy\n\t\t:quant (x3 / some)\n\t\t:ARG0-of (x6 / play-02\n\t\t\t:ARG1 (x8 / game))))");
        assertEquals(amr,
                "(x2 (see-01 (:ARG0 (x1 girl)) (:ARG1 (x4 (boy (:quant (x3 some)) (:ARG0-of (x6 (play-02 (:ARG1 (x8 game))))))))))");

        String ast = t.transformToGF(amr).get(0);
        assertEquals(ast,
                "(mkText (mkUtt (mkS (mkCl (mkNP S.a_Quant (mkCN L.girl_N)) (mkVP L.see_V2 (mkNP S.somePl_Det (mkCN (mkCN L.boy_N) (mkRS (mkRCl S.which_RP (mkVP L.play_V2 (mkNP S.a_Quant (mkCN L.game_N))))))))))) fullStopPunct)");

        generateBody(Thread.currentThread().getStackTrace()[1].getMethodName(), ast, true);
    }

    // Girls see some pretty boys who play a ball game.
    // FIXME: ':mod A' ("pretty boys") vs. ':mod N' ("ball game")
    @Test
    public void t20_girls_see_some_pretty_boys_who_play_a_ball_game() {
        Transformer t = new Transformer(rules, roles, false);

        String amr = t.transformToLISP(
                "(x2 / see-01\n\t:ARG0 (x1 / girl)\n\t:ARG1 (x5 / boy\n\t\t:quant (x3 / some)\n\t\t:mod (x4 / pretty)\n\t\t:ARG0-of (x7 / play-02\n\t\t\t:ARG1 (x10 / game\n\t\t\t\t:mod (x9 / ball)))))");
        assertEquals(amr,
                "(x2 (see-01 (:ARG0 (x1 girl)) (:ARG1 (x5 (boy (:quant (x3 some)) (:mod (x4 pretty)) (:ARG0-of (x7 (play-02 (:ARG1 (x10 (game (:mod (x9 ball)))))))))))))");

        String ast = t.transformToGF(amr).get(0);
        assertEquals(ast,
                "(mkText (mkUtt (mkS (mkCl (mkNP S.a_Quant (mkCN L.girl_N)) (mkVP L.see_V2 (mkNP S.somePl_Det (mkCN (mkCN L.pretty_A L.boy_N) (mkRS (mkRCl S.which_RP (mkVP L.play_V2 (mkNP S.a_Quant (E.CompoundCN L.ball_N L.game_N))))))))))) fullStopPunct)");

        generateBody(Thread.currentThread().getStackTrace()[1].getMethodName(), ast, false);
    }

    // Girls who see the game like the boys who play.
    // FIXME: "A girl who sees the game likes the boys who play." (CAMR)
    @Test
    public void t21_girls_who_see_the_game_like_the_boys_who_play() {
        Transformer t = new Transformer(rules, roles, false);

        String amr = t.transformToLISP(
                "(x6 / like-01\n\t:ARG0 (x1 / girl\n\t\t:ARG0-of (x3 / see-01\n\t\t\t:ARG1 (x5 / game)))\n\t:ARG1 (x8 / boy\n\t\t:ARG0-of (x10 / play-02)))");
        assertEquals(amr,
                "(x6 (like-01 (:ARG0 (x1 (girl (:ARG0-of (x3 (see-01 (:ARG1 (x5 game)))))))) (:ARG1 (x8 (boy (:ARG0-of (x10 play-02)))))))");

        String ast = t.transformToGF(amr).get(0);
        assertEquals(ast,
                "(mkText (mkUtt (mkS (mkCl (mkNP S.a_Quant (mkCN (mkCN L.girl_N) (mkRS (mkRCl S.which_RP (mkVP L.see_V2 (mkNP S.a_Quant (mkCN L.game_N))))))) (mkVP L.like_V2 (mkNP S.a_Quant (mkCN (mkCN L.boy_N) (mkRS (mkRCl S.which_RP (mkVP L.play_V))))))))) fullStopPunct)");

        generateBody(Thread.currentThread().getStackTrace()[1].getMethodName(), ast, true);
    }

    // Assad spoke about the city.
    // TODO: "Assad gave a speech about the city.":
    // give-01 vs. speak-01 / speech vs. speak-01 (CAMR?)
    // TODO: Asma_al-Assad vs. Bashar_al-Assad (wiki)
    @Test
    public void t22_Assad_spoke_about_the_city() {
        Transformer t = new Transformer(rules, roles, false);

        String amr = t.transformToLISP(
                "(x2 / speak-01\n\t:ARG0 (x1 / person\n\t\t:name (n / name\n\t\t\t:op1 \"Assad\")\n\t\t:wiki \"Asma_al-Assad\")\n\t:topic (x4 / city))");
        assertEquals(amr,
                "(x2 (speak-01 (:ARG0 (x1 (person (:name (n (name (:op1 \"Assad\")))) (:wiki \"Asma_al-Assad\")))) (:topic (x4 city))))");

        String ast = t.transformToGF(amr).get(0);
        assertEquals(ast,
                "(mkText (mkUtt (mkS (mkCl (mkNP (P.mkPN \"Assad\")) (mkVP (mkVP L.speak_V) (S.mkAdv L.about_Prep (mkNP S.a_Quant (mkCN L.city_N))))))) fullStopPunct)");

        generateBody(Thread.currentThread().getStackTrace()[1].getMethodName(), ast, false);
    }

    // Assad spoke about the two cities.
    // FIXME: CAMR
    @Test
    public void t23_Assad_spoke_about_the_two_cities() {
        Transformer t = new Transformer(rules, roles, false);

        String amr = t.transformToLISP(
                "(x2 / speak-01\n\t:ARG0 (x1 / person\n\t\t:name (n / name\n\t\t\t:op1 \"Assad\")\n\t\t:wiki \"Asma_al-Assad\")\n\t:topic (x4 / city :quant 2))");
        assertEquals(amr,
                "(x2 (speak-01 (:ARG0 (x1 (person (:name (n (name (:op1 \"Assad\")))) (:wiki \"Asma_al-Assad\")))) (:topic (x4 (city (:quant 2))))))");

        String ast = t.transformToGF(amr).get(0);
        assertEquals(ast,
                "(mkText (mkUtt (mkS (mkCl (mkNP (P.mkPN \"Assad\")) (mkVP (mkVP L.speak_V) (S.mkAdv L.about_Prep (mkNP S.a_Quant (mkNum (mkDigits \"2\")) (mkCN L.city_N))))))) fullStopPunct)");

        generateBody(Thread.currentThread().getStackTrace()[1].getMethodName(), ast, false);
    }

    // Assad spoke a word about the city.
    @Test
    public void t24_Assad_spoke_a_word_about_the_city() {
        Transformer t = new Transformer(rules, roles, false);

        String amr = t.transformToLISP(
                "(x2 / speak-01\n\t:ARG0 (x1 / person\n\t\t:name (n / name\n\t\t\t:op1 \"Assad\")\n\t\t:wiki \"Asma_al-Assad\")\n\t:ARG1 (x4 / word\n\t\t:topic (x7 / city)))");
        assertEquals(amr,
                "(x2 (speak-01 (:ARG0 (x1 (person (:name (n (name (:op1 \"Assad\")))) (:wiki \"Asma_al-Assad\")))) (:ARG1 (x4 (word (:topic (x7 city)))))))");

        String ast = t.transformToGF(amr).get(0);
        assertEquals(ast,
                "(mkText (mkUtt (mkS (mkCl (mkNP (P.mkPN \"Assad\")) (mkVP L.speak_V2 (mkNP S.a_Quant (mkCN (mkCN L.word_N) (S.mkAdv L.about_Prep (mkNP S.a_Quant (mkCN L.city_N))))))))) fullStopPunct)");

        generateBody(Thread.currentThread().getStackTrace()[1].getMethodName(), ast, false);
    }

    // The boy is a person.
    @Test
    public void t25_the_boy_is_a_person() {
        Transformer t = new Transformer(rules, roles, false);

        String amr = t.transformToLISP(
                "(x5 / person\n\t:domain (x2 / boy))");
        assertEquals(amr,
                "(x5 (person (:domain (x2 boy))))");

        String ast = t.transformToGF(amr).get(0);
        assertEquals(ast,
                "(mkText (mkUtt (mkS (mkCl (mkNP S.a_Quant (mkCN L.boy_N)) (mkNP S.a_Quant (mkCN L.person_N))))) fullStopPunct)");

        generateBody(Thread.currentThread().getStackTrace()[1].getMethodName(), ast, true);
    }

    // ::snt Iceland is a very interesting example.
    @Test
    public void t26_Iceland_is_a_very_interesting_example() {
        Transformer t = new Transformer(rules, roles, false);

        String amr = t.transformToLISP(
                "(e / example :ARG2-of (i / interest-01 :degree (v / very)) :domain (c / country :wiki \"Iceland\" :name (n / name :op1 \"Iceland\")))");
        assertEquals(amr,
                "(e (example (:ARG2-of (i (interest-01 (:degree (v very))))) (:domain (c (country (:wiki \"Iceland\") (:name (n (name (:op1 \"Iceland\")))))))))");

        String ast = t.transformToGF(amr).get(0);
        assertEquals(ast,
                "(mkText (mkUtt (mkS (mkCl (mkNP (P.mkPN \"Iceland\")) (mkNP S.a_Quant (mkCN (mkCN L.example_N) (mkRS (mkRCl S.which_RP (mkAP L.very_AdA (mkAP L.interest_A))))))))) fullStopPunct)");

        generateBody(Thread.currentThread().getStackTrace()[1].getMethodName(), ast, false);
    }

    // # ::snt They are thugs and deserve a bullet.
    // TODO: the ellipsis/antecedent of the second subject (subject-verb agreement)
    // FIXME: in the gold AMR, shouldn't it be ":ARG0 t2"?
    @Test
    public void t27_they_are_thugs_and_deserve_a_bullet() {
        Transformer t = new Transformer(rules, roles, false);

        String amr = t.transformToLISP(
                "(a / and :op1 (t / thug :domain (t2 / they)) :op2 (d / deserve-01 :ARG0 t :ARG1 (b / bullet)))");
        assertEquals(amr,
                "(a (and (:op1 (t (thug (:domain (t2 they))))) (:op2 (d (deserve-01 (:ARG0 t) (:ARG1 (b bullet)))))))");

        String ast = t.transformToGF(amr).get(0);
        assertEquals(ast,
                "(mkText (mkUtt (mkS S.and_Conj (mkListS (mkS (mkCl S.they_NP (mkNP S.a_Quant (mkCN L.thug_N)))) (mkS (mkCl (mkVP L.deserve_V2 (mkNP S.a_Quant (mkCN L.bullet_N)))))))) fullStopPunct)");

        generateBody(Thread.currentThread().getStackTrace()[1].getMethodName(), ast, true);
    }

    // ::snt China president urges child safety [after school killings].
    // FIXME: safe-01 changed to protect-01 (Did the AMR annotator made a mistake?)
    // TODO: "after school killings"
    @Test
    public void t28_China_president_urges_child_safety() {
        Transformer t = new Transformer(rules, roles, false);

        String amr = t.transformToLISP(
                "(u / urge-01 :ARG0 (p / person :ARG0-of (h / have-org-role-91 :ARG1 (c / country :wiki \"China\" :name (n / name :op1 \"China\")) :ARG2 (p2 / president))) :ARG2 (s / protect-01 :ARG1 (c2 / child)))");
        assertEquals(amr,
                "(u (urge-01 (:ARG0 (p (person (:ARG0-of (h (have-org-role-91 (:ARG1 (c (country (:wiki \"China\") (:name (n (name (:op1 \"China\"))))))) (:ARG2 (p2 president)))))))) (:ARG2 (s (protect-01 (:ARG1 (c2 child)))))))");

        String ast = t.transformToGF(amr).get(0);
        assertEquals(ast,
                "(mkText (mkUtt (mkS (mkCl (mkNP (mkCN (P.mkN2 L.president_N L.of_Prep) (mkNP (P.mkPN \"China\")))) (mkVP L.urge_VV (mkVP L.protect_V2 (mkNP S.a_Quant (mkCN L.child_N))))))) fullStopPunct)");

        generateBody(Thread.currentThread().getStackTrace()[1].getMethodName(), ast, false);
    }

    // ::snt French far-left killer leaves jail.
    // TODO: person that kills => killer (etc.)
    @Test
    public void t29_French_far_left_killer_leaves_jail() {
        Transformer t = new Transformer(rules, roles, false);

        String amr = t.transformToLISP(
                "(l2 / leave-11 :ARG0 (p2 / person :ARG0-of (k2 / kill-01) :mod (c / country :wiki \"France\" :name (n2 / name :op1 \"France\")) :mod (l / left :degree (f / far))) :ARG1 (j / jail))");
        assertEquals(amr,
                "(l2 (leave-11 (:ARG0 (p2 (person (:ARG0-of (k2 kill-01)) (:mod (c (country (:wiki \"France\") (:name (n2 (name (:op1 \"France\"))))))) (:mod (l (left (:degree (f far)))))))) (:ARG1 (j jail))))");

        String ast = t.transformToGF(amr).get(0);
        assertEquals(ast,
                "(mkText (mkUtt (mkS (mkCl (mkNP S.a_Quant (mkCN (mkCN (mkCN L.far_A (mkCN L.left_A L.person_N)) (S.mkAdv L.from_Prep (mkNP (P.mkPN \"France\")))) (mkRS (mkRCl S.which_RP (mkVP L.kill_V))))) (mkVP L.leave_V2 (mkNP S.a_Quant (mkCN L.jail_N)))))) fullStopPunct)");

        generateBody(Thread.currentThread().getStackTrace()[1].getMethodName(), ast, false);
    }

    // ::snt Two other school assailants have committed suicide.
    @Test
    public void t30_two_other_school_assailants_have_committed_suicide() {
        Transformer t = new Transformer(rules, roles, false);

        String amr = t.transformToLISP(
                "(c / commit-02 :ARG0 (p / person :quant 2 :ARG0-of (a / assail-01 :ARG1 (s2 / school)) :mod (o / other)) :ARG1 (s / suicide))");
        assertEquals(amr,
                "(c (commit-02 (:ARG0 (p (person (:quant 2) (:ARG0-of (a (assail-01 (:ARG1 (s2 school))))) (:mod (o other))))) (:ARG1 (s suicide))))");

        String ast = t.transformToGF(amr).get(0);
        assertEquals(ast,
                "(mkText (mkUtt (mkS (mkCl (mkNP S.a_Quant (mkNum (mkDigits \"2\")) (mkCN (mkCN L.other_A L.person_N) (mkRS (mkRCl S.which_RP (mkVP L.assail_V2 (mkNP S.a_Quant (mkCN L.school_N))))))) (mkVP L.commit_V2 (mkNP S.a_Quant (mkCN L.suicide_N)))))) fullStopPunct)");

        generateBody(Thread.currentThread().getStackTrace()[1].getMethodName(), ast, true);
    }

    // ::snt Gadhafi attacks US in speech in Italy.
    // TODO: when_Subj [it_NP] => when_Subj he_NP (:wiki "Muammar_Gaddafi")
    @Test
    public void t31_Gadhafi_attacks_US_in_speech_in_Italy() {
        Transformer t = new Transformer(rules, roles, false);

        String amr = t.transformToLISP(
                "(a / attack-01 :ARG0 (p / person :wiki \"Muammar_Gaddafi\" :name (n / name :op1 \"Gadhafi\")) :ARG1 (c / country :wiki \"United_States\" :name (n2 / name :op1 \"US\")) :subevent-of (s / speak-01 :ARG0 p :location (c2 / country :wiki \"Italy\" :name (n3 / name :op1 \"Italy\"))))");
        assertEquals(amr,
                "(a (attack-01 (:ARG0 (p (person (:wiki \"Muammar_Gaddafi\") (:name (n (name (:op1 \"Gadhafi\"))))))) (:ARG1 (c (country (:wiki \"United_States\") (:name (n2 (name (:op1 \"US\"))))))) (:subevent-of (s (speak-01 (:ARG0 p) (:location (c2 (country (:wiki \"Italy\") (:name (n3 (name (:op1 \"Italy\"))))))))))))");

        String ast = t.transformToGF(amr).get(0);
        assertEquals(ast,
                "(mkText (mkUtt (mkS (mkCl (mkNP (P.mkPN \"Gadhafi\")) (mkVP (mkVP L.attack_V2 (mkNP (P.mkPN \"US\"))) (S.mkAdv S.when_Subj (mkS (mkCl (mkVP (mkVP L.speak_V) (S.mkAdv L.in_Prep (mkNP (P.mkPN \"Italy\"))))))))))) fullStopPunct)");

        generateBody(Thread.currentThread().getStackTrace()[1].getMethodName(), ast, false);
    }

    // ::snt We must look at their reasons.
    // TODO: look => look-at by default (?)
    @Test
    public void t32_we_must_look_at_their_reasons() {
        Transformer t = new Transformer(rules, roles, false);

        String amr = t.transformToLISP(
                "(o / obligate-01 :ARG1 (w / we) :ARG2 (l / look-01 :ARG1 (r / reason :poss (t / they))))");
        assertEquals(amr,
                "(o (obligate-01 (:ARG1 (w we)) (:ARG2 (l (look-01 (:ARG1 (r (reason (:poss (t they))))))))))");

        String ast = t.transformToGF(amr).get(0);
        assertEquals(ast,
                "(mkText (mkUtt (mkS (mkCl S.we_NP (mkVP (passiveVP L.obligate_V2) (E.PurposeVP (mkVP L.look_V2 (mkNP S.they_Pron (mkCN L.reason_N)))))))) fullStopPunct)");

        generateBody(Thread.currentThread().getStackTrace()[1].getMethodName(), ast, false);
    }

    // ::snt The man, Xu Yuyuan, wielded a knife usually used to slaughter pigs.
    // TODO: "the man [named] Xu Yuyuan"
    @Test
    public void t33_the_man_Xu_Yuyuan_wielded_a_knife_usually_used_to_slaughter_pigs() {
        Transformer t = new Transformer(rules, roles, false);

        String amr = t.transformToLISP(
                "(w / wield-01 :ARG0 (m / man :wiki - :name (n / name :op1 \"Xu\" :op2 \"Yuyuan\")) :ARG1 (k / knife :ARG1-of (u / use-01 :ARG2 (s / slaughter-01 :ARG1 (p / pig)) :mod (u2 / usual))))");
        assertEquals(amr,
                "(w (wield-01 (:ARG0 (m (man (:wiki -) (:name (n (name (:op1 \"Xu\") (:op2 \"Yuyuan\"))))))) (:ARG1 (k (knife (:ARG1-of (u (use-01 (:ARG2 (s (slaughter-01 (:ARG1 (p pig))))) (:mod (u2 usual))))))))))");

        String ast = t.transformToGF(amr).get(0);
        assertEquals(ast,
                "(mkText (mkUtt (mkS (mkCl (mkNP (P.mkPN \"Xu Yuyuan\")) (mkVP L.wield_V2 (mkNP S.a_Quant (mkCN (mkCN L.knife_N) (mkRS (mkRCl S.which_RP (mkVP (mkVP (P.mkAdV \"usually\") (passiveVP L.use_V2)) (E.PurposeVP (mkVP L.slaughter_V2 (mkNP S.a_Quant (mkCN L.pig_N))))))))))))) fullStopPunct)");

        generateBody(Thread.currentThread().getStackTrace()[1].getMethodName(), ast, false);
    }

    // ::snt Libyan Abdel Basset Ali al-Megrahi was convicted of blowing up the plane.
    @Test
    public void t34_Libyan_Abdel_Basset_Ali_al_Megrahi_was_convicted_of_blowing_up_the_plane() {
        Transformer t = new Transformer(rules, roles, false);

        String amr = t.transformToLISP(
                "(c / convict-01 :ARG1 (p / person :wiki \"Abdelbaset_al-Megrahi\" :name (n / name :op1 \"Abdel\" :op2 \"Basset\" :op3 \"Ali\" :op4 \"al-Megrahi\") :mod (c2 / country :wiki \"Libya\" :name (n2 / name :op1 \"Libya\"))) :ARG2 (b / blow-up-06 :ARG0 p :ARG1 (p2 / plane)))");
        assertEquals(amr,
                "(c (convict-01 (:ARG1 (p (person (:wiki \"Abdelbaset_al-Megrahi\") (:name (n (name (:op1 \"Abdel\") (:op2 \"Basset\") (:op3 \"Ali\") (:op4 \"al-Megrahi\")))) (:mod (c2 (country (:wiki \"Libya\") (:name (n2 (name (:op1 \"Libya\")))))))))) (:ARG2 (b (blow-up-06 (:ARG0 p) (:ARG1 (p2 plane)))))))");

        String ast = t.transformToGF(amr).get(0);
        assertEquals(ast,
                "(mkText (mkUtt (mkS (mkCl (mkNP (mkNP (P.mkPN \"Abdel Basset Ali al-Megrahi\")) (S.mkAdv L.from_Prep (mkNP (P.mkPN \"Libya\")))) (mkVP (passiveVP L.convict_V2) (E.PurposeVP (mkVP L.blow_up_V2 (mkNP S.a_Quant (mkCN L.plane_N)))))))) fullStopPunct)");

        generateBody(Thread.currentThread().getStackTrace()[1].getMethodName(), ast, false);
    }

    // ::snt A fourth member, Jean-Marc Rouillan, remains behind bars.
    @Test
    public void t35_a_fourth_member_Jean_Marc_Rouillan_remains_behind_bars() {
        Transformer t = new Transformer(rules, roles, false);

        String amr = t.transformToLISP(
                "(r / remain-01 :ARG1 (p / person :wiki - :name (n / name :op1 \"Jean-Marc\" :op2 \"Rouillan\") :mod (p2 / person :ARG0-of (h / have-org-role-91 :ARG2 (m / member)) :ord (o / ordinal-entity :value 4))) :ARG3 (b / behind :op1 (b2 / bar)))");
        assertEquals(amr,
                "(r (remain-01 (:ARG1 (p (person (:wiki -) (:name (n (name (:op1 \"Jean-Marc\") (:op2 \"Rouillan\")))) (:mod (p2 (person (:ARG0-of (h (have-org-role-91 (:ARG2 (m member))))) (:ord (o (ordinal-entity (:value 4)))))))))) (:ARG3 (b (behind (:op1 (b2 bar)))))))");

        String ast = t.transformToGF(amr).get(0);
        assertEquals(ast,
                "(mkText (mkUtt (mkS (mkCl (mkNP (mkNP (P.mkPN \"Jean-Marc Rouillan\")) (mkRS (mkRCl S.which_RP (mkNP (mkDet S.the_Quant (S.mkOrd (mkDigits \"4\"))) (mkCN (P.mkN2 L.member_N L.of_Prep)))))) (mkVP (passiveVP L.remain_V2) (S.mkAdv L.behind_Prep (mkNP S.a_Quant (mkCN L.bar_N))))))) fullStopPunct)");

        generateBody(Thread.currentThread().getStackTrace()[1].getMethodName(), ast, false);
    }

    // ::snt I'd never heard of this case until now.
    // TODO: hear => hear-of by default (?)
    @Test
    public void t36_I_d_never_heard_of_this_case_until_now() {
        Transformer t = new Transformer(rules, roles, false);

        String amr = t.transformToLISP(
                "(h / hear-01 :polarity - :ARG0 (i / i) :ARG1 (c / case :mod (t / this)) :time (u / until :op1 (n / now)))");
        assertEquals(amr,
                "(h (hear-01 (:polarity -) (:ARG0 (i i)) (:ARG1 (c (case (:mod (t this))))) (:time (u (until (:op1 (n now)))))))");

        String ast = t.transformToGF(amr).get(0);
        assertEquals(ast,
                "(mkText (mkUtt (mkS negativePol (mkCl S.i_NP (mkVP (mkVP L.hear_V2 (mkNP S.this_Det (mkCN L.case_N))) (S.mkAdv L.until_Prep (mkNP L.now_N)))))) fullStopPunct)");

        generateBody(Thread.currentThread().getStackTrace()[1].getMethodName(), ast, false);
    }

    // ::snt So, I googled it to get more information.
    @Test
    public void t37_so_I_googled_it_to_get_more_information() {
        Transformer t = new Transformer(rules, roles, false);

        String amr = t.transformToLISP(
                "(g / google-01 :ARG0 (i / i) :ARG1 (i2 / it) :purpose (g2 / get-01 :ARG0 i :ARG1 (i3 / information :mod (m / more))))");
        assertEquals(amr,
                "(g (google-01 (:ARG0 (i i)) (:ARG1 (i2 it)) (:purpose (g2 (get-01 (:ARG0 i) (:ARG1 (i3 (information (:mod (m more))))))))))");

        String ast = t.transformToGF(amr).get(0);
        assertEquals(ast,
                "(mkText (mkUtt (mkS (mkCl S.i_NP (mkVP (mkVP L.google_V2 S.it_NP) (E.PurposeVP (mkVP L.get_V2 (mkNP L.more_Det (mkCN L.information_N)))))))) fullStopPunct)");

        generateBody(Thread.currentThread().getStackTrace()[1].getMethodName(), ast, false);
    }

    // ::snt Even the information that is available is fuzzy.
    // FIXME: "even" is incorrectly attached in the gold AMR
    @Test
    public void t38_even_the_information_that_is_available_is_fuzzy() {
        Transformer t = new Transformer(rules, roles, false);

        String amr = t.transformToLISP(
                "(f / fuzzy :domain (i / information :ARG1-of (a / available-02)) :mod (e / even))");
        assertEquals(amr,
                "(f (fuzzy (:domain (i (information (:ARG1-of (a available-02))))) (:mod (e even))))");

        String ast = t.transformToGF(amr).get(0);
        assertEquals(ast,
                "(mkText (mkUtt (mkS (mkCl (mkNP (mkCN L.available_A (mkCN L.information_N))) (mkAP L.even_AdA (mkAP L.fuzzy_A))))) fullStopPunct)");

        generateBody(Thread.currentThread().getStackTrace()[1].getMethodName(), ast, false);
    }

    // ::snt As for the race angle, it is unnecessary.
    // FIXME: "race angle" (race_N + angle_N), like "ball game" in t20
    @Test
    public void t39_as_for_the_race_angle_it_is_unnecessary() {
        Transformer t = new Transformer(rules, roles, false);

        String amr = t.transformToLISP(
                "(n / need-01 :polarity - :ARG1 (a / angle :mod (r / race)))");
        assertEquals(amr,
                "(n (need-01 (:polarity -) (:ARG1 (a (angle (:mod (r race)))))))");

        String ast = t.transformToGF(amr).get(0);
        assertEquals(ast,
                "(mkText (mkUtt (mkS negativePol (mkCl (mkNP S.a_Quant (E.CompoundCN L.race_N L.angle_N)) (passiveVP L.need_V2)))) fullStopPunct)");

        generateBody(Thread.currentThread().getStackTrace()[1].getMethodName(), ast, false);
    }

    // ::snt It's a horrible thing that happened.
    // FIXME: an incomplete AMR (?)
    @Test
    public void t40_it_s_a_horrible_thing_that_happened() {
        Transformer t = new Transformer(rules, roles, false);

        String amr = t.transformToLISP(
                "(t / thing :mod (h / horrible))");
        assertEquals(amr,
                "(t (thing (:mod (h horrible))))");

        String ast = t.transformToGF(amr).get(0);
        assertEquals(ast,
                "(mkText (mkUtt (mkNP S.a_Quant (mkCN L.horrible_A L.thing_N))))");

        generateBody(Thread.currentThread().getStackTrace()[1].getMethodName(), ast, false);
    }

    // ::snt You are an idiot.
    @Test
    public void t41_you_are_an_idiot() {
        Transformer t = new Transformer(rules, roles, false);

        String amr = t.transformToLISP(
                "(i / idiot :domain (y / you))");
        assertEquals(amr,
                "(i (idiot (:domain (y you))))");

        String ast = t.transformToGF(amr).get(0);
        assertEquals(ast,
                "(mkText (mkUtt (mkS (mkCl S.you_NP (mkNP S.a_Quant (mkCN L.idiot_N))))) fullStopPunct)");

        generateBody(Thread.currentThread().getStackTrace()[1].getMethodName(), ast, false);
    }

    // ::snt They need to throw these punks in jail!
    // TODO: reconstruct missing prepositions, depending on frame/verb, argument role
    // (e.g. GOL_Prep) and/or the head of the NP.
    // TODO: consider statistics from PropBank and FrameNet corpora
    // (clearly dominant verb/frame-specific prepositions vs. NP-specific cases).
    // FIXME: missing (:mode expressive) in the AMR graph
    @Test
    public void t42_they_need_to_throw_these_punks_in_jail() {
        Transformer t = new Transformer(rules, roles, false);

        String amr = t.transformToLISP(
                "(o / obligate-01 :ARG1 (t / they) :ARG2 (t2 / throw-01 :ARG0 t :ARG1 (p / punk :mod (t3 / this)) :ARG2 (j / jail)))");
        assertEquals(amr,
                "(o (obligate-01 (:ARG1 (t they)) (:ARG2 (t2 (throw-01 (:ARG0 t) (:ARG1 (p (punk (:mod (t3 this))))) (:ARG2 (j jail)))))))");

        String ast = t.transformToGF(amr).get(0);
        assertEquals(ast,
                "(mkText (mkUtt (mkS (mkCl S.they_NP (mkVP (passiveVP L.obligate_V2) (E.PurposeVP (mkVP (mkVP L.throw_V2 (mkNP S.this_Det (mkCN L.punk_N))) (S.mkAdv L.GOL_Prep (mkNP S.a_Quant (mkCN L.jail_N))))))))) fullStopPunct)");

        generateBody(Thread.currentThread().getStackTrace()[1].getMethodName(), ast, false);
    }

    // ::snt They should have been expelled from school at a minimum.
    // TODO: DIR_Prep (see also t42)
    @Test
    public void t43_they_should_have_been_expelled_from_school_at_a_minimum() {
        Transformer t = new Transformer(rules, roles, false);

        String amr = t.transformToLISP(
                "(r / recommend-01 :ARG1 (e / expel-01 :ARG1 (t / they) :ARG2 (s / school) :degree (a / at-a-minimum)))");
        assertEquals(amr,
                "(r (recommend-01 (:ARG1 (e (expel-01 (:ARG1 (t they)) (:ARG2 (s school)) (:degree (a at-a-minimum)))))))");

        String ast = t.transformToGF(amr).get(0);
        assertEquals(ast,
                "(mkText (mkUtt (mkS (mkCl (mkVP (passiveVP L.recommend_V2) (S.mkAdv S.that_Subj (mkS (mkCl S.they_NP (mkVP (mkVP (passiveVP L.expel_V2) (S.mkAdv L.DIR_Prep (mkNP S.a_Quant (mkCN L.school_N)))) (P.mkAdv \"at a minimum\"))))))))) fullStopPunct)");

        generateBody(Thread.currentThread().getStackTrace()[1].getMethodName(), ast, false);
    }

    // ::snt My opinion is based on the information provided.
    // FIXME: DIR_Prep
    @Test
    public void t44_my_opinion_is_based_on_the_information_provided() {
        Transformer t = new Transformer(rules, roles, false);

        String amr = t.transformToLISP(
                "(b / base-02 :ARG1 (t / thing :ARG1-of (o / opine-01 :ARG0 (i / i))) :ARG2 (i2 / information :ARG1-of (p / provide-01)))");
        assertEquals(amr,
                "(b (base-02 (:ARG1 (t (thing (:ARG1-of (o (opine-01 (:ARG0 (i i)))))))) (:ARG2 (i2 (information (:ARG1-of (p provide-01)))))))");

        String ast = t.transformToGF(amr).get(0);
        assertEquals(ast,
                "(mkText (mkUtt (mkS (mkCl (mkNP S.a_Quant (mkCN (mkCN L.thing_N) (mkRS (mkRCl S.which_RP S.i_NP L.opine_V2)))) (mkVP (passiveVP L.base_V2) (S.mkAdv L.DIR_Prep (mkNP (mkCN (mkCN L.information_N) (mkRS (mkRCl S.which_RP (passiveVP L.provide_V2)))))))))) fullStopPunct)");

        generateBody(Thread.currentThread().getStackTrace()[1].getMethodName(), ast, false);
    }

    // ::snt Texas criminal courts and prosecutors do not coddle to anyone.
    // TODO: 'person that prosecutes' => prosecutor
    // (t29: 'person that kills' => killer; t50: 'person that perpetrates' => perpetrator)
    // TODO: [[criminal courts] and [prosecutors] in Texas] - :location - coreference and attachment
    // FIXME: 'court that is criminal' - an "overannotated" AMR? (criminal-03 vs. :mod)
    @Test
    public void t45_Texas_criminal_courts_and_prosecutors_do_not_coddle_to_anyone() {
        Transformer t = new Transformer(rules, roles, false);

        String amr = t.transformToLISP(
                "(c / coddle-01 :polarity - :ARG0 (a / and :op1 (c2 / court :ARG0-of (c4 / criminal-03) :location (s / state :wiki \"Texas\" :name (n / name :op1 \"Texas\"))) :op2 (p / person :ARG0-of (p2 / prosecute-01) :location s)) :ARG1 (a2 / anyone))");
        assertEquals(amr,
                "(c (coddle-01 (:polarity -) (:ARG0 (a (and (:op1 (c2 (court (:ARG0-of (c4 criminal-03)) (:location (s (state (:wiki \"Texas\") (:name (n (name (:op1 \"Texas\")))))))))) (:op2 (p (person (:ARG0-of (p2 prosecute-01)) (:location s))))))) (:ARG1 (a2 anyone))))");

        String ast = t.transformToGF(amr).get(0);
        assertEquals(ast,
                "(mkText (mkUtt (mkS negativePol (mkCl (mkNP S.and_Conj (mkListNP (mkNP S.a_Quant (mkCN L.criminal_A (mkCN (mkCN L.court_N) (S.mkAdv L.in_Prep (mkNP (P.mkPN \"Texas\")))))) (mkNP S.a_Quant (mkCN (mkCN L.person_N) (mkRS (mkRCl S.which_RP (mkVP L.prosecute_V))))))) (mkVP L.coddle_V2 L.anyone_NP)))) fullStopPunct)");

        generateBody(Thread.currentThread().getStackTrace()[1].getMethodName(), ast, false);
    }

    // ::snt I don't think it is a race issue either.
    // FIXME: attachment of 'either' (annotation vs. transformation issue)
    @Test
    public void t46_I_don_t_think_it_is_a_race_issue_either() {
        Transformer t = new Transformer(rules, roles, false);

        String amr = t.transformToLISP(
                "(t / think-01 :ARG0 (i / i) :ARG1 (i2 / issue-02 :polarity - :ARG0 (i3 / it) :mod (r / race)) :mod (e / either))");
        assertEquals(amr,
                "(t (think-01 (:ARG0 (i i)) (:ARG1 (i2 (issue-02 (:polarity -) (:ARG0 (i3 it)) (:mod (r race))))) (:mod (e either))))");

        String ast = t.transformToGF(amr).get(0);
        assertEquals(ast,
                "(mkText (mkUtt (mkS (mkCl S.i_NP (mkVP (P.mkAdV \"either\") (mkVP L.think_VS (mkS negativePol (mkCl S.it_NP (mkNP S.a_Quant (E.CompoundCN L.race_N L.issue_N))))))))) fullStopPunct)");

        generateBody(Thread.currentThread().getStackTrace()[1].getMethodName(), ast, false);
    }

    // The girl is very nice and the boy is very good.
    @Test
    public void t47_the_girl_is_very_nice_and_the_boy_is_very_good() {
        Transformer t = new Transformer(rules, roles, false);

        String amr = t.transformToLISP(
                "(x6 / and\n\t:op1 (x5 / nice-01\n\t\t:ARG0 (x2 / girl)\n\t\t:degree (x4 / very))\n\t:op2 (x11 / good\n\t\t:domain (x8 / boy)\n\t\t:degree (x10 / very)))");
        assertEquals(amr,
                "(x6 (and (:op1 (x5 (nice-01 (:ARG0 (x2 girl)) (:degree (x4 very))))) (:op2 (x11 (good (:domain (x8 boy)) (:degree (x10 very)))))))");

        String ast = t.transformToGF(amr).get(0);
        assertEquals(ast,
                "(mkText (mkUtt (mkS S.and_Conj (mkListS (mkS (mkCl (mkNP S.a_Quant (mkCN L.girl_N)) (mkAP L.very_AdA (mkAP L.nice_A)))) (mkS (mkCl (mkNP S.a_Quant (mkCN L.boy_N)) (mkAP L.very_AdA (mkAP L.good_A))))))) fullStopPunct)");

        generateBody(Thread.currentThread().getStackTrace()[1].getMethodName(), ast, true);
    }

    // ::snt Women are horny as hell!
    // FIXME: word order (position of AdA), based on some heuristics...
    @Test
    public void t48_women_are_horny_as_hell() {
        Transformer t = new Transformer(rules, roles, false);

        String amr = t.transformToLISP(
                "(h / horny :mode expressive :domain (w / woman) :degree (a / as-hell))");
        assertEquals(amr,
                "(h (horny (:mode expressive) (:domain (w woman)) (:degree (a as-hell))))");

        String ast = t.transformToGF(amr).get(0);
        assertEquals(ast,
                "(mkText (mkUtt (mkS (mkCl (mkNP S.a_Quant (mkCN L.woman_N)) (mkAP (P.mkAdA \"as hell\") (mkAP L.horny_A))))) exclMarkPunct)");

        generateBody(Thread.currentThread().getStackTrace()[1].getMethodName(), ast, false);
    }

    // ::snt Is it a possibility there is another side to this?
    // FIXME: is :part-of a correct AMR annotation in this case?
    @Test
    public void t49_is_it_a_possibility_there_is_another_side_to_this() {
        Transformer t = new Transformer(rules, roles, false);

        String amr = t.transformToLISP(
                "(p / possible-01 :mode interrogative :ARG1 (s / side :mod (a / another) :part-of (t / this)))");
        assertEquals(amr,
                "(p (possible-01 (:mode interrogative) (:ARG1 (s (side (:mod (a another)) (:part-of (t this)))))))");

        String ast = t.transformToGF(amr).get(0);
        assertEquals(ast,
                "(mkText (mkUtt (mkQS (mkQCl (mkCl S.it_NP (mkAP (mkAP L.possible_A) (mkS (mkCl (mkNP L.another_Det (mkCN (mkCN L.side_N) (S.mkAdv L.part_Prep S.this_NP)))))))))) questMarkPunct)");

        generateBody(Thread.currentThread().getStackTrace()[1].getMethodName(), ast, false);
    }

    // The girl left because the boy arrived.
    @Test
    public void t50_the_girl_left_because_the_boy_arrived() {
        Transformer t = new Transformer(rules, roles, false);

        String amr = t.transformToLISP(
                "(l / leave-01 :ARG0 (g / girl) :ARG1-of (c / cause-01 :ARG0 (a / arrive-01 :ARG0 (b / boy))))");
        assertEquals(amr,
                "(l (leave-01 (:ARG0 (g girl)) (:ARG1-of (c (cause-01 (:ARG0 (a (arrive-01 (:ARG0 (b boy))))))))))");

        String ast = t.transformToGF(amr).get(0);
        assertEquals(ast,
                "(mkText (mkUtt (mkS (mkCl (mkNP S.a_Quant (mkCN L.girl_N)) (mkVP (mkVP L.leave_V) (S.mkAdv S.because_Subj (mkS (mkCl (mkNP S.a_Quant (mkCN L.boy_N)) (mkVP L.arrive_V)))))))) fullStopPunct)");

        generateBody(Thread.currentThread().getStackTrace()[1].getMethodName(), ast, false);
    }

    // Due to historical reasons, what originally belongs us has become controversial.
    // FIXME: [it] 'is become' [something] => [it] 'has become' [something]
    // TODO: comma after Adv
    @Test
    public void t51_due_to_historical_reasons_what_originally_belongs_us_has_become_controversial() {
        Transformer t = new Transformer(rules, roles, false);

        String amr = t.transformToLISP(
                "(c4 / cause-01 :ARG0 (r / reason :mod (h / history)) :ARG1 (b2 / become-01 :ARG1 (t / thing :ARG0-of (b3 / belong-01 :ARG1 (w2 / we) :mod (o / original))) :ARG2 (c3 / controversy)))");
        assertEquals(amr,
                "(c4 (cause-01 (:ARG0 (r (reason (:mod (h history))))) (:ARG1 (b2 (become-01 (:ARG1 (t (thing (:ARG0-of (b3 (belong-01 (:ARG1 (w2 we)) (:mod (o original)))))))) (:ARG2 (c3 controversy)))))))");

        String ast = t.transformToGF(amr).get(0);
        assertEquals(ast,
                "(mkText (mkUtt (mkS (S.mkAdv S.because_Subj (mkS (mkCl (mkNP S.a_Quant (E.CompoundCN L.history_N L.reason_N))))) (mkS (mkCl (mkNP S.a_Quant (mkCN (mkCN L.thing_N) (mkRS (mkRCl S.which_RP (mkVP (P.mkAdV \"originally\") (mkVP L.belong_V2 S.we_NP)))))) (mkVP (passiveVP L.become_V2) (S.mkAdv L.PRD_Prep (mkNP S.a_Quant (mkCN L.controversy_N)))))))) fullStopPunct)");

        generateBody(Thread.currentThread().getStackTrace()[1].getMethodName(), ast, false);
    }

    // The people are already incredibly fully equipped.
    @Test
    public void t52_the_people_are_already_incredibly_fully_equipped() {
        Transformer t = new Transformer(rules, roles, false);

        String amr = t.transformToLISP(
                "(e / equip-01 :ARG1 (p / person) :time (a3 / already) :manner (f / full) :manner (i / incredible))");
        assertEquals(amr,
                "(e (equip-01 (:ARG1 (p person)) (:time (a3 already)) (:manner (f full)) (:manner (i incredible))))");

        String ast = t.transformToGF(amr).get(0);
        assertEquals(ast,
                "(mkText (mkUtt (mkS (mkCl (mkNP S.a_Quant (mkCN L.person_N)) (mkVP (P.mkAdV \"fully\") (mkVP (P.mkAdV \"incredibly\") (mkVP (P.mkAdV \"already\") (passiveVP L.equip_V2))))))) fullStopPunct)");

        generateBody(Thread.currentThread().getStackTrace()[1].getMethodName(), ast, false);
    }

    // Never go back to that time when signing the treaties!
    @Test
    public void t53_never_go_back_to_that_time_when_signing_the_treaties() {
        Transformer t = new Transformer(rules, roles, false);

        String amr = t.transformToLISP(
                "(g / go-back-19 :mode imperative :polarity - :ARG0 (y / you) :ARG2 (t2 / time :mod (t3 / that) :time (s / sign-02 :ARG0 (w / we) :ARG1 (t / treaty))) :time (e / ever))");
        assertEquals(amr,
                "(g (go-back-19 (:mode imperative) (:polarity -) (:ARG0 (y you)) (:ARG2 (t2 (time (:mod (t3 that)) (:time (s (sign-02 (:ARG0 (w we)) (:ARG1 (t treaty)))))))) (:time (e ever))))");

        String ast = t.transformToGF(amr).get(0);
        assertEquals(ast,
                "(mkText (mkUtt (mkS negativePol (mkCl S.you_NP (mkVP (mkVP (P.mkAdV \"ever\") (mkVP L.go_back_V)) (S.mkAdv L.DIR_Prep (mkNP S.that_Det (mkCN (mkCN L.time_N) (S.mkAdv S.when_Subj (mkS (mkCl S.we_NP (mkVP L.sign_V2 (mkNP S.a_Quant (mkCN L.treaty_N))))))))))))) exclMarkPunct)");

        generateBody(Thread.currentThread().getStackTrace()[1].getMethodName(), ast, false);
    }

    // Radio Nepal reported that 3 policemen were killed and 19 others wounded when their vehicle
    // was ambushed by guerrillas in western Nepal.
    @Test
    public void
            t54_Radio_Nepal_reported_that_3_policemen_were_killed_and_19_others_wounded_when_their_vehicle_was_ambushed_by_guerrillas_in_western_Nepal() {
        Transformer t = new Transformer(rules, roles, false);

        String amr = t.transformToLISP(
                "(r / report-01 :ARG0 (p3 / publication :name (n / name :op1 \"Radio\" :op2 \"Nepal\")) :ARG1 (a / and :op1 (k / kill-01 :ARG1 (p / policeman :quant 3)) :op2 (w / wound-01 :ARG1 (p2 / policeman :quant 19 :mod (o2 / other))) :time (a3 / ambush-01 :ARG0 (g / guerrilla) :ARG1 (v / vehicle) :location (w3 / west :part-of (c / country :name (n2 / name :op1 \"Nepal\"))))))");
        assertEquals(amr,
                "(r (report-01 (:ARG0 (p3 (publication (:name (n (name (:op1 \"Radio\") (:op2 \"Nepal\"))))))) (:ARG1 (a (and (:op1 (k (kill-01 (:ARG1 (p (policeman (:quant 3))))))) (:op2 (w (wound-01 (:ARG1 (p2 (policeman (:quant 19) (:mod (o2 other)))))))) (:time (a3 (ambush-01 (:ARG0 (g guerrilla)) (:ARG1 (v vehicle)) (:location (w3 (west (:part-of (c (country (:name (n2 (name (:op1 \"Nepal\"))))))))))))))))))");

        String ast = t.transformToGF(amr).get(0);
        assertEquals(ast,
                "(mkText (mkUtt (mkS (mkCl (mkNP (P.mkPN \"Radio Nepal\")) (mkVP L.report_VS (mkS S.and_Conj (mkListS (mkS (mkCl (mkNP S.a_Quant (mkNum (mkDigits \"3\")) (mkCN L.policeman_N)) (passiveVP L.kill_V2))) (mkS (mkCl (mkNP S.a_Quant (mkNum (mkDigits \"19\")) (mkCN L.other_A L.policeman_N)) (mkVP (passiveVP L.wound_V2) (S.mkAdv S.when_Subj (mkS (mkCl (mkNP S.a_Quant (mkCN L.guerrilla_N)) (mkVP (mkVP L.ambush_V2 (mkNP S.a_Quant (mkCN L.vehicle_N))) (S.mkAdv L.in_Prep (mkNP S.the_Quant (mkCN (mkCN L.west_N) (S.mkAdv L.part_Prep (mkNP (P.mkPN \"Nepal\"))))))))))))))))))) fullStopPunct)");

        generateBody(Thread.currentThread().getStackTrace()[1].getMethodName(), ast, false);
    }

    // I don't know if anyone will read this.
    @Test
    public void t55_I_don_t_know_if_anyone_will_read_this() {
        Transformer t = new Transformer(rules, roles, false);

        String amr = t.transformToLISP(
                "(k / know-01 :polarity - :ARG0 (i / i) :ARG1 (r / read-01 :mode interrogative :ARG0 (a / anyone) :ARG1 (t / this)))");
        assertEquals(amr,
                "(k (know-01 (:polarity -) (:ARG0 (i i)) (:ARG1 (r (read-01 (:mode interrogative) (:ARG0 (a anyone)) (:ARG1 (t this)))))))");

        String ast = t.transformToGF(amr).get(0);
        assertEquals(ast,
                "(mkText (mkUtt (mkS negativePol (mkCl S.i_NP (mkVP (mkVP L.know_V) (S.mkAdv S.if_Subj (mkS (mkCl L.anyone_NP (mkVP L.read_V2 S.this_NP)))))))) fullStopPunct)");

        generateBody(Thread.currentThread().getStackTrace()[1].getMethodName(), ast, false);
    }

    // It was unclear whether combat had taken place between Russian and Georgian soldiers or had
    // been limited to fighting between separatists and Georgian forces.
    // TODO: 'whether [..] or whether [..]'
    // TODO: 'Georgian forces' (cannot be resolved by a pronoun)
    @Test
    public void
            t56_it_was_unclear_whether_combat_had_taken_place_between_Russian_and_Georgian_soldiers_or_had_been_limited_to_fighting_between_separatists_and_Georgian_forces() {
        Transformer t = new Transformer(rules, roles, false);

        String amr = t.transformToLISP(
                "(c / clear-06 :polarity - :ARG1 (o / or :mode interrogative :op1 (c2 / combat-01 :ARG0 (a3 / and :op1 (s / soldier :mod (c3 / country :name (n / name :op1 \"Russia\"))) :op2 (s3 / soldier :mod (c4 / country :name (n2 / name :op1 \"Georgia\"))))) :op2 (l2 / limit-01 :ARG1 c2 :ARG2 (f / fight-01 :ARG0 (b / between :op1 (s2 / separatist) :op2 (f2 / force))))))");
        assertEquals(amr,
                "(c (clear-06 (:polarity -) (:ARG1 (o (or (:mode interrogative) (:op1 (c2 (combat-01 (:ARG0 (a3 (and (:op1 (s (soldier (:mod (c3 (country (:name (n (name (:op1 \"Russia\")))))))))) (:op2 (s3 (soldier (:mod (c4 (country (:name (n2 (name (:op1 \"Georgia\")))))))))))))))) (:op2 (l2 (limit-01 (:ARG1 c2) (:ARG2 (f (fight-01 (:ARG0 (b (between (:op1 (s2 separatist)) (:op2 (f2 force))))))))))))))))");

        String ast = t.transformToGF(amr).get(0);
        assertEquals(ast,
                "(mkText (mkUtt (mkS negativePol (mkCl (mkVP (mkVP (mkAP L.clear_A)) (S.mkAdv S.if_Subj (mkS S.or_Conj (mkListS (mkS (mkCl (mkNP S.and_Conj (mkListNP (mkNP S.a_Quant (mkCN (mkCN L.soldier_N) (S.mkAdv L.from_Prep (mkNP (P.mkPN \"Russia\"))))) (mkNP S.a_Quant (mkCN (mkCN L.soldier_N) (S.mkAdv L.from_Prep (mkNP (P.mkPN \"Georgia\"))))))) (mkVP L.combat_V))) (mkS (mkCl (mkVP (passiveVP L.limit_V2) (E.PurposeVP (mkVP (mkVP L.fight_V) (S.mkAdv L.between_Prep (mkNP S.and_Conj (mkListNP (mkNP S.a_Quant (mkCN L.separatist_N)) (mkNP S.a_Quant (mkCN L.force_N))))))))))))))))) fullStopPunct)");

        generateBody(Thread.currentThread().getStackTrace()[1].getMethodName(), ast, false);
    }

    // Especially China suffered the ravages of Japan.
    @Test
    public void t57_especially_China_suffered_the_ravages_of_Japan() {
        Transformer t = new Transformer(rules, roles, false);

        String amr = t.transformToLISP(
                "(s / suffer-01 :ARG0 (c / country :name (n / name :op1 \"China\") :mod (e / especially)) :ARG1 (r / ravage-01 :ARG0 (c2 / country :name (n2 / name :op1 \"Japan\")) :ARG1 c))");
        assertEquals(amr,
                "(s (suffer-01 (:ARG0 (c (country (:name (n (name (:op1 \"China\")))) (:mod (e especially))))) (:ARG1 (r (ravage-01 (:ARG0 (c2 (country (:name (n2 (name (:op1 \"Japan\"))))))) (:ARG1 c))))))");

        String ast = t.transformToGF(amr).get(0);
        assertEquals(ast,
                "(mkText (mkUtt (mkS (mkCl (mkNP (ss \"especially\") (mkNP (P.mkPN \"China\"))) (mkVP L.suffer_VS (mkS (mkCl (mkNP (P.mkPN \"Japan\")) (mkVP L.ravage_V))))))) fullStopPunct)");

        generateBody(Thread.currentThread().getStackTrace()[1].getMethodName(), ast, false);
    }

    // I started university in September.
    @Test
    public void t58_I_started_university_in_September() {
        Transformer t = new Transformer(rules, roles, false);

        String amr = t.transformToLISP(
                "(s / start-01 :ARG0 (i / i) :ARG1 (u / university) :time (d / date-entity :month 9))");
        assertEquals(amr,
                "(s (start-01 (:ARG0 (i i)) (:ARG1 (u university)) (:time (d (date-entity (:month 9))))))");

        String ast = t.transformToGF(amr).get(0);
        assertEquals(ast,
                "(mkText (mkUtt (mkS (mkCl S.i_NP (mkVP (mkVP L.start_V2 (mkNP S.a_Quant (mkCN L.university_N))) (monthAdv september_Month))))) fullStopPunct)");

        generateBody(Thread.currentThread().getStackTrace()[1].getMethodName(), ast, false);
    }

    // We have been broken up since August.
    @Test
    public void t59_we_have_been_broken_up_since_August() {
        Transformer t = new Transformer(rules, roles, false);

        String amr = t.transformToLISP(
                "(b / break-up-08 :ARG1 (w / we) :time (s2 / since :op1 (d / date-entity :month 8)))");
        assertEquals(amr,
                "(b (break-up-08 (:ARG1 (w we)) (:time (s2 (since (:op1 (d (date-entity (:month 8)))))))))");

        String ast = t.transformToGF(amr).get(0);
        assertEquals(ast,
                "(mkText (mkUtt (mkS (mkCl S.we_NP (mkVP (passiveVP L.break_up_V2) (S.mkAdv L.since_Prep (mkNP (monthPN august_Month))))))) fullStopPunct)");

        generateBody(Thread.currentThread().getStackTrace()[1].getMethodName(), ast, false);
    }

    // I started university on 1 September 1999.
    @Test
    public void t60_I_started_university_on_1_September_1999() {
        Transformer t = new Transformer(rules, roles, false);

        String amr = t.transformToLISP(
                "(s / start-01 :ARG0 (i / i) :ARG1 (u / university) :time (d / date-entity :year 1999 :month 9 :day 1))");
        assertEquals(amr,
                "(s (start-01 (:ARG0 (i i)) (:ARG1 (u university)) (:time (d (date-entity (:year 1999) (:month 9) (:day 1))))))");

        String ast = t.transformToGF(amr).get(0);
        assertEquals(ast,
                "(mkText (mkUtt (mkS (mkCl S.i_NP (mkVP (mkVP L.start_V2 (mkNP S.a_Quant (mkCN L.university_N))) (dayMonthYearAdv (intMonthday (ss \"1\")) september_Month (intYear (ss \"1999\"))))))) fullStopPunct)");

        generateBody(Thread.currentThread().getStackTrace()[1].getMethodName(), ast, false);
    }

    // I started university in 1999.
    @Test
    public void t61_I_started_university_in_1999() {
        Transformer t = new Transformer(rules, roles, false);

        String amr = t.transformToLISP(
                "(s / start-01 :ARG0 (i / i) :ARG1 (u / university) :time (d / date-entity :year 1999))");
        assertEquals(amr,
                "(s (start-01 (:ARG0 (i i)) (:ARG1 (u university)) (:time (d (date-entity (:year 1999))))))");

        String ast = t.transformToGF(amr).get(0);
        assertEquals(ast,
                "(mkText (mkUtt (mkS (mkCl S.i_NP (mkVP (mkVP L.start_V2 (mkNP S.a_Quant (mkCN L.university_N))) (yearAdv (intYear (ss \"1999\"))))))) fullStopPunct)");

        generateBody(Thread.currentThread().getStackTrace()[1].getMethodName(), ast, false);
    }

    // You could go to the library on Saturdays.
    // FIXME: word order (time goes last)
    @Test
    public void t62_you_could_go_to_the_library_on_Saturdays() {
        Transformer t = new Transformer(rules, roles, false);

        String amr = t.transformToLISP(
                "(p / possible-01 :ARG1 (g / go-02 :ARG0 (y / you) :ARG4 (l / library) :time (d / date-entity :weekday (s / saturday))))");
        assertEquals(amr,
                "(p (possible-01 (:ARG1 (g (go-02 (:ARG0 (y you)) (:ARG4 (l library)) (:time (d (date-entity (:weekday (s saturday))))))))))");

        String ast = t.transformToGF(amr).get(0);
        assertEquals(ast,
                "(mkText (mkUtt (mkS (mkCl S.it_NP (mkAP (mkAP L.possible_A) (mkS (mkCl S.you_NP (mkVP (mkVP (mkVP L.go_V) (S.mkAdv L.GOL_Prep (mkNP S.a_Quant (mkCN L.library_N)))) (weekdayPunctualAdv saturday_Weekday)))))))) fullStopPunct)");

        generateBody(Thread.currentThread().getStackTrace()[1].getMethodName(), ast, false);
    }

    // The US government has given $3.3 billion to Colombia in the past 5 years.
    // FIXME: word order (time goes last)
    // FIXME: large numbers (Predef.error)
    @Test
    public void t63_the_US_government_has_given_3_3_billion_to_Colombia_in_the_past_5_years() {
        Transformer t = new Transformer(rules, roles, false);

        String amr = t.transformToLISP(
                "(g / give-01 :ARG0 (g2 / government-organization :ARG0-of (g3 / govern-01 :ARG1 (c / country :name (n / name :op1 \"US\")))) :ARG1 (m / monetary-quantity :quant 3300000000 :unit (d / dollar)) :ARG2 (c2 / country :name (n2 / name :op1 \"Colombia\")) :time (p / past :op1 (t / temporal-quantity :quant 5 :unit (y / year))))");
        assertEquals(amr,
                "(g (give-01 (:ARG0 (g2 (government-organization (:ARG0-of (g3 (govern-01 (:ARG1 (c (country (:name (n (name (:op1 \"US\"))))))))))))) (:ARG1 (m (monetary-quantity (:quant 3300000000) (:unit (d dollar))))) (:ARG2 (c2 (country (:name (n2 (name (:op1 \"Colombia\"))))))) (:time (p (past (:op1 (t (temporal-quantity (:quant 5) (:unit (y year))))))))))");

        String ast = t.transformToGF(amr).get(0);
        assertEquals(ast,
                "(mkText (mkUtt (mkS (mkCl (mkNP S.a_Quant (mkCN (mkCN L.organization_N) (mkRS (mkRCl S.which_RP (mkVP L.govern_V2 (mkNP (P.mkPN \"US\"))))))) (mkVP (mkVP (mkVP L.give_V2 (mkNP S.a_Quant (mkNum (mkDigits \"3300000000\")) (mkCN L.dollar_N))) (S.mkAdv L.GOL_Prep (mkNP (P.mkPN \"Colombia\")))) (S.mkAdv (P.mkPrep \"past\") (mkNP S.a_Quant (mkNum (mkDigits \"5\")) (mkCN L.year_N))))))) fullStopPunct)");

        generateBody(Thread.currentThread().getStackTrace()[1].getMethodName(), ast, false);
    }

    // Youngest brother is a tender youth.
    @Test
    public void t64_youngest_brother_is_a_tender_youth() {
        Transformer t = new Transformer(rules, roles, false);

        String amr = t.transformToLISP(
                "(y / youth :ARG1-of (t / tender-02) :domain (p / person :ARG0-of (h / have-rel-role-91 :ARG2 (b / brother :mod (y2 / young :degree (m / most))))))");
        assertEquals(amr,
                "(y (youth (:ARG1-of (t tender-02)) (:domain (p (person (:ARG0-of (h (have-rel-role-91 (:ARG2 (b (brother (:mod (y2 (young (:degree (m most))))))))))))))))");

        String ast = t.transformToGF(amr).get(0);
        assertEquals(ast,
                "(mkText (mkUtt (mkS (mkCl (mkNP (mkCN (mkAP (S.mkOrd L.young_A)) (mkCN (P.mkN2 L.brother_N L.of_Prep)))) (mkNP (mkCN L.tender_A (mkCN L.youth_N)))))) fullStopPunct)");

        generateBody(Thread.currentThread().getStackTrace()[1].getMethodName(), ast, false);
    }

    // I'd recommend you go and see your doctor.
    // FIXME: 'a doctor' (vs. '[the] president of China')
    // FIXME: 'your doctor'
    @Test
    public void t65_I_d_recommend_you_go_and_see_your_doctor() {
        Transformer t = new Transformer(rules, roles, false);

        String amr = t.transformToLISP(
                "(r / recommend-01 :ARG0 (i / i) :ARG1 (g / go-02 :ARG0 (y / you) :purpose (s / see-01 :ARG0 y :ARG1 (p / person :ARG0-of (h / have-rel-role-91 :ARG1 y :ARG2 (d / doctor))))) :ARG2 y)");
        assertEquals(amr,
                "(r (recommend-01 (:ARG0 (i i)) (:ARG1 (g (go-02 (:ARG0 (y you)) (:purpose (s (see-01 (:ARG0 y) (:ARG1 (p (person (:ARG0-of (h (have-rel-role-91 (:ARG1 y) (:ARG2 (d doctor)))))))))))))) (:ARG2 y)))");

        String ast = t.transformToGF(amr).get(0);
        assertEquals(ast,
                "(mkText (mkUtt (mkS (mkCl S.i_NP (mkVP L.recommend_VS (mkS (mkCl S.you_NP (mkVP (mkVP L.go_V) (E.PurposeVP (mkVP L.see_V2 (mkNP (mkCN (P.mkN2 L.doctor_N L.of_Prep)))))))))))) fullStopPunct)");

        generateBody(Thread.currentThread().getStackTrace()[1].getMethodName(), ast, false);
    }

    // Two successful companies enter the market in a big way.
    @Test
    public void t66_two_successful_companies_enter_the_market_in_a_big_way() {
        Transformer t = new Transformer(rules, roles, false);

        String amr = t.transformToLISP(
                "(e / enter-01 :ARG0 (c / company :quant 2 :mod (s / successful)) :ARG1 (m / market) :manner (w / way :mod (b / big)))");
        assertEquals(amr,
                "(e (enter-01 (:ARG0 (c (company (:quant 2) (:mod (s successful))))) (:ARG1 (m market)) (:manner (w (way (:mod (b big)))))))");

        String ast = t.transformToGF(amr).get(0);
        assertEquals(ast,
                "(mkText (mkUtt (mkS (mkCl (mkNP S.a_Quant (mkNum (mkDigits \"2\")) (mkCN L.successful_A L.company_N)) (mkVP (mkVP L.enter_V2 (mkNP S.a_Quant (mkCN L.market_N))) (S.mkAdv L.in_Prep (mkNP S.a_Det (mkCN L.big_A L.way_N))))))) fullStopPunct)");

        generateBody(Thread.currentThread().getStackTrace()[1].getMethodName(), ast, false);
    }

    // ::snt How Long are We Going to Tolerate Japan?
    @Test
    public void t67_how_long_are_we_going_to_tolerate_Japan() {
        Transformer t = new Transformer(rules, roles, false);

        String amr = t.transformToLISP(
                "(t / tolerate-01 :ARG0 (w / we) :ARG1 (c / country :name (n / name :op1 \"Japan\")) :duration (a / amr-unknown))");
        assertEquals(amr,
                "(t (tolerate-01 (:ARG0 (w we)) (:ARG1 (c (country (:name (n (name (:op1 \"Japan\"))))))) (:duration (a amr-unknown))))");

        String ast = t.transformToGF(amr).get(0);
        assertEquals(ast,
                "(mkText (mkUtt (mkQS (mkQCl (mkIAdv S.how_IAdv (S.mkAdv L.long_A)) (mkCl S.we_NP (mkVP L.tolerate_V2 (mkNP (P.mkPN \"Japan\"))))))) questMarkPunct)");

        generateBody(Thread.currentThread().getStackTrace()[1].getMethodName(), ast, false);
    }

    // How do we fly?
    @Test
    public void t68_how_do_we_fly() {
        Transformer t = new Transformer(rules, roles, false);

        String amr = t.transformToLISP(
                "(a / fly-01 :ARG0 (w / we) :manner (a2 / amr-unknown))");
        assertEquals(amr,
                "(a (fly-01 (:ARG0 (w we)) (:manner (a2 amr-unknown))))");

        String ast = t.transformToGF(amr).get(0);
        assertEquals(ast,
                "(mkText (mkUtt (mkQS (mkQCl S.how_IAdv (mkCl S.we_NP (mkVP L.fly_V))))) questMarkPunct)");

        generateBody(Thread.currentThread().getStackTrace()[1].getMethodName(), ast, false);
    }

    // How can we fly?
    @Test
    public void t69_how_can_we_fly() {
        Transformer t = new Transformer(rules, roles, false);

        String amr = t.transformToLISP(
                "(p / possible-01 :ARG1 (a / fly-01 :ARG0 (w / we) :manner (a2 / amr-unknown)))");
        assertEquals(amr,
                "(p (possible-01 (:ARG1 (a (fly-01 (:ARG0 (w we)) (:manner (a2 amr-unknown)))))))");

        String ast = t.transformToGF(amr).get(0);
        assertEquals(ast,
                "(mkText (mkUtt (mkQS (mkQCl S.how_IAdv (mkCl S.it_NP (mkAP (mkAP L.possible_A) (mkS (mkCl S.we_NP (mkVP L.fly_V)))))))) questMarkPunct)");

        generateBody(Thread.currentThread().getStackTrace()[1].getMethodName(), ast, false);
    }

    // What did the girl find?
    @Test
    public void t70_what_did_the_girl_find() {
        Transformer t = new Transformer(rules, roles, false);

        String amr = t.transformToLISP(
                "(f / find-01 :ARG0 (g / girl) :ARG1 (a / amr-unknown))");
        assertEquals(amr,
                "(f (find-01 (:ARG0 (g girl)) (:ARG1 (a amr-unknown))))");

        String ast = t.transformToGF(amr).get(0);
        assertEquals(ast,
                "(mkText (mkUtt (mkQS (mkQCl L.what_IAdv (mkCl (mkNP S.a_Quant (mkCN L.girl_N)) (mkVP L.find_V))))) questMarkPunct)");

        generateBody(Thread.currentThread().getStackTrace()[1].getMethodName(), ast, false);
    }

    // Where did the girl find the boy?
    @Test
    public void t71_where_did_the_girl_find_the_boy() {
        Transformer t = new Transformer(rules, roles, false);

        String amr = t.transformToLISP(
                "(f / find-01 :ARG0 (g / girl) :ARG1 (b / boy) :location (a / amr-unknown))");
        assertEquals(amr,
                "(f (find-01 (:ARG0 (g girl)) (:ARG1 (b boy)) (:location (a amr-unknown))))");

        String ast = t.transformToGF(amr).get(0);
        assertEquals(ast,
                "(mkText (mkUtt (mkQS (mkQCl S.where_IAdv (mkCl (mkNP S.a_Quant (mkCN L.girl_N)) (mkVP L.find_V2 (mkNP S.a_Quant (mkCN L.boy_N))))))) questMarkPunct)");

        generateBody(Thread.currentThread().getStackTrace()[1].getMethodName(), ast, false);
    }

    // Create a few battle groups.
    @Test
    public void t72_create_a_few_battle_groups() {
        Transformer t = new Transformer(rules, roles, false);

        String amr = t.transformToLISP(
                "(c / create-01 :ARG1 (g / group :mod (b / battle-01) :quant (f / few)) :li 2)");
        assertEquals(amr,
                "(c (create-01 (:ARG1 (g (group (:mod (b battle-01)) (:quant (f few))))) (:li 2)))");

        String ast = t.transformToGF(amr).get(0);
        assertEquals(ast,
                "(mkText (mkUtt (mkS (mkCl (mkNP S.few_Det (E.CompoundCN L.battle_N L.group_N)) (passiveVP L.create_V2)))) fullStopPunct)");

        generateBody(Thread.currentThread().getStackTrace()[1].getMethodName(), ast, false);
    }

    // I suffer from random panic attacks.
    // FIXME: missing 'from' (AMR vs. PropBank)
    @Test
    public void t73_I_suffer_from_random_panic_attacks() {
        Transformer t = new Transformer(rules, roles, false);

        String amr = t.transformToLISP(
                "(s2 / suffer-01 :ARG0 (i / i) :ARG1 (a2 / attack :mod (p2 / panic-01) :mod (r / random)))");
        assertEquals(amr,
                "(s2 (suffer-01 (:ARG0 (i i)) (:ARG1 (a2 (attack (:mod (p2 panic-01)) (:mod (r random)))))))");

        String ast = t.transformToGF(amr).get(0);
        assertEquals(ast,
                "(mkText (mkUtt (mkS (mkCl S.i_NP (mkVP L.suffer_V2 (mkNP S.a_Quant (mkCN L.random_A (E.CompoundCN L.panic_N L.attack_N))))))) fullStopPunct)");

        generateBody(Thread.currentThread().getStackTrace()[1].getMethodName(), ast, false);
    }

    // The list names companies that were prevented from carrying out deals.
    @Test
    public void t74_the_list_names_companies_that_were_prevented_from_carrying_out_deals() {
        Transformer t = new Transformer(rules, roles, false);

        String amr = t.transformToLISP(
                "(n / name-01 :ARG0 (l / list) :ARG1 (c / company :ARG1-of (p / prevent-01 :ARG2 (c6 / carry-out-03 :ARG0 a2 :ARG1 (d / deal-01)))))");
        assertEquals(amr,
                "(n (name-01 (:ARG0 (l list)) (:ARG1 (c (company (:ARG1-of (p (prevent-01 (:ARG2 (c6 (carry-out-03 (:ARG0 a2) (:ARG1 (d deal-01)))))))))))))");

        String ast = t.transformToGF(amr).get(0);
        assertEquals(ast,
                "(mkText (mkUtt (mkS (mkCl (mkNP S.a_Quant (mkCN L.list_N)) (mkVP L.name_V2 (mkNP S.a_Quant (mkCN (mkCN L.company_N) (mkRS (mkRCl S.which_RP (mkVP (passiveVP L.prevent_V2) (E.PurposeVP (mkVP L.carry_out_V2 (mkNP S.a_Quant (mkCN L.deal_N))))))))))))) fullStopPunct)");

        generateBody(Thread.currentThread().getStackTrace()[1].getMethodName(), ast, false);
    }

    // I have tried to solve my problems.
    // FIXME: 'my problems' (poss)
    @Test
    public void t75_I_have_tried_to_solve_my_problems() {
        Transformer t = new Transformer(rules, roles, false);

        String amr = t.transformToLISP(
                "(t / try-01 :ARG0 (i / i) :ARG1 (s / solve-01 :ARG0 i :ARG1 (p / problem :poss i)))");
        assertEquals(amr,
                "(t (try-01 (:ARG0 (i i)) (:ARG1 (s (solve-01 (:ARG0 i) (:ARG1 (p (problem (:poss i)))))))))");

        String ast = t.transformToGF(amr).get(0);
        assertEquals(ast,
                "(mkText (mkUtt (mkS (mkCl S.i_NP (mkVP L.try_VV (mkVP L.solve_V2 (mkNP S.a_Quant (mkCN L.problem_N))))))) fullStopPunct)");

        generateBody(Thread.currentThread().getStackTrace()[1].getMethodName(), ast, false);
    }

    // If it gets worse then go to the doctor's.
    // FIXME: order of Adv
    @Test
    public void t76_if_it_gets_worse_then_go_to_the_doctor_s() {
        Transformer t = new Transformer(rules, roles, false);

        String amr = t.transformToLISP(
                "(g / go-02 :mode imperative :ARG0 (y / you) :ARG4 (d / doctor) :condition (w / worsen-01 :ARG1 (i / it)))");
        assertEquals(amr,
                "(g (go-02 (:mode imperative) (:ARG0 (y you)) (:ARG4 (d doctor)) (:condition (w (worsen-01 (:ARG1 (i it)))))))");

        String ast = t.transformToGF(amr).get(0);
        assertEquals(ast,
                "(mkText (mkUtt (mkS (mkCl S.you_NP (mkVP (mkVP (mkVP L.go_V) (S.mkAdv L.GOL_Prep (mkNP S.a_Quant (mkCN L.doctor_N)))) (S.mkAdv S.if_Subj (mkS (mkCl S.it_NP (passiveVP L.worsen_V2)))))))) exclMarkPunct)");

        generateBody(Thread.currentThread().getStackTrace()[1].getMethodName(), ast, false);
    }

    // ::snt If you tell people they can help you.
    // FIXME: co-references (:ARG0, :ARG2)
    @Test
    public void t77_if_you_tell_people_they_can_help_you() {
        Transformer t = new Transformer(rules, roles, false);

        String amr = t.transformToLISP(
                "(p / possible-01 :ARG1 (h / help-01 :ARG0 (p2 / person) :ARG1 (y / you)) :condition (t / tell-01 :ARG0 y :ARG2 p2))");
        assertEquals(amr,
                "(p (possible-01 (:ARG1 (h (help-01 (:ARG0 (p2 person)) (:ARG1 (y you))))) (:condition (t (tell-01 (:ARG0 y) (:ARG2 p2))))))");

        String ast = t.transformToGF(amr).get(0);
        assertEquals(ast,
                "(mkText (mkUtt (mkS (mkCl (mkVP (mkVP (mkAP (mkAP L.possible_A) (mkS (mkCl (mkNP S.a_Quant (mkCN L.person_N)) (mkVP L.help_V2 S.you_NP))))) (S.mkAdv S.if_Subj (mkS (mkCl (mkVP L.tell_V)))))))) fullStopPunct)");

        generateBody(Thread.currentThread().getStackTrace()[1].getMethodName(), ast, false);
    }

    // ::snt What do Chinese still tolerate...
    @Test
    public void t78_what_do_Chinese_still_tolerate() {
        Transformer t = new Transformer(rules, roles, false);

        String amr = t.transformToLISP(
                "(t / tolerate-01 :ARG0 (p / person :mod (c / country :wiki \"China\" :name (n / name :op1 \"China\"))) :ARG1 (a / amr-unknown) :mod (s / still))");
        assertEquals(amr,
                "(t (tolerate-01 (:ARG0 (p (person (:mod (c (country (:wiki \"China\") (:name (n (name (:op1 \"China\")))))))))) (:ARG1 (a amr-unknown)) (:mod (s still))))");

        String ast = t.transformToGF(amr).get(0);
        assertEquals(ast,
                "(mkText (mkUtt (mkQS (mkQCl L.what_IAdv (mkCl (mkNP S.a_Quant (mkCN (mkCN L.person_N) (S.mkAdv L.from_Prep (mkNP (P.mkPN \"China\"))))) (mkVP (P.mkAdV \"still\") (mkVP L.tolerate_V)))))) questMarkPunct)");

        generateBody(Thread.currentThread().getStackTrace()[1].getMethodName(), ast, false);
    }

    // ::snt Xinhua News Agency, Tokyo, September 1st, by reporter Yiguo Yu
    @Test
    public void t79_Xinhua_News_Agency_Tokyo_September_1st_by_reporter_Yiguo_Yu() {
        Transformer t = new Transformer(rules, roles, false);

        String amr = t.transformToLISP(
                "(b / byline-91 :ARG0 (p2 / publication :name (n / name :op1 \"Xinhua\" :op2 \"News\" :op3 \"Agency\")) :ARG1 (p / person :name (n2 / name :op1 \"Yiguo\" :op2 \"Yu\") :ARG0-of (r / report-01)) :location (c2 / city :name (n3 / name :op1 \"Tokyo\")) :time (d / date-entity :month 9 :day 1))");
        assertEquals(amr,
                "(b (byline-91 (:ARG0 (p2 (publication (:name (n (name (:op1 \"Xinhua\") (:op2 \"News\") (:op3 \"Agency\"))))))) (:ARG1 (p (person (:name (n2 (name (:op1 \"Yiguo\") (:op2 \"Yu\")))) (:ARG0-of (r report-01))))) (:location (c2 (city (:name (n3 (name (:op1 \"Tokyo\"))))))) (:time (d (date-entity (:month 9) (:day 1))))))");

        String ast = t.transformToGF(amr).get(0);
        assertEquals(ast,
                "(mkText (mkUtt (mkS (mkCl (mkNP (P.mkPN \"Xinhua News Agency\")) (mkVP (mkVP (mkVP L.byline_V2 (mkNP (P.mkPN \"Yiguo Yu\"))) (dayMonthAdv (intMonthday (ss \"1\")) september_Month)) (S.mkAdv L.in_Prep (mkNP (P.mkPN \"Tokyo\"))))))) fullStopPunct)");

        generateBody(Thread.currentThread().getStackTrace()[1].getMethodName(), ast, false);
    }

    // ::snt i have sevral slits on my arm,
    @Test
    public void t80_i_have_sevral_slits_on_my_arm() {
        Transformer t = new Transformer(rules, roles, false);

        String amr = t.transformToLISP(
                "(h / have-03 :ARG0 (i / i) :ARG1 (s / slit :location (a / arm :part-of i) :quant (s2 / several)))");
        assertEquals(amr,
                "(h (have-03 (:ARG0 (i i)) (:ARG1 (s (slit (:location (a (arm (:part-of i)))) (:quant (s2 several)))))))");

        String ast = t.transformToGF(amr).get(0);
        assertEquals(ast,
                "(mkText (mkUtt (mkS (mkCl S.i_NP (mkVP L.have_V2 (mkNP L.several_Det (mkCN (mkCN L.slit_N) (S.mkAdv L.in_Prep (mkNP S.i_Pron (mkCN L.arm_N))))))))) fullStopPunct)");

        generateBody(Thread.currentThread().getStackTrace()[1].getMethodName(), ast, false);
    }

    // ::snt Looks like we still need to train more outdoors .
    // FIXME: in_Prep outdoors_N => outdoors_Adv
    // TODO: location (o / outdoor) vs.location (o / outdoors)
    // FIXME: "more train" => "train more" (AdV => Adv)
    // FIXME: "it is looked that" => "it looks [like] that" (idiom)
    @Test
    public void t81_Looks_like_we_still_need_to_train_more_outdoors() {
        Transformer t = new Transformer(rules, roles, false);

        String amr = t.transformToLISP(
                "(l / look-02 :ARG1 (n / need-01 :ARG0 (w / we) :ARG1 (t / train-01 :ARG0 w :ARG2 w :quant (m / more) :location (o / outdoors)) :mod (s / still)))");
        assertEquals(amr,
                "(l (look-02 (:ARG1 (n (need-01 (:ARG0 (w we)) (:ARG1 (t (train-01 (:ARG0 w) (:ARG2 w) (:quant (m more)) (:location (o outdoors))))) (:mod (s still)))))))");

        String ast = t.transformToGF(amr).get(0);
        assertEquals(ast,
                "(mkText (mkUtt (mkS (mkCl (mkVP (passiveVP L.look_V2) (S.mkAdv S.that_Subj (mkS (mkCl S.we_NP (mkVP (P.mkAdV \"still\") (mkVP L.need_VV (mkVP (mkVP (mkVP L.train_V) L.more_Adv) L.outdoors_Adv)))))))))) fullStopPunct)");

        generateBody(Thread.currentThread().getStackTrace()[1].getMethodName(), ast, false);
    }

}
