import org.scalatest.FunSuite
import jpl._
import jpl.Util._
import wp.prolog._


class RecordSuite extends FunSuite {

	consult("test")
	val fixName = "fixture"
	val fix = new RecordedQuery(fixName)
	
	def fixture =
		new {
			val a = new AQuery("a")
			val b = new AQuery("b")
		}

	test("record undo") {
		val f = fixture
		fix()
		assert( (f.a() && f.b()) === true )
		fix.undo
		expect(2) { fix.records.length }
		f.a.rewind
		f.b.rewind
		assert( (f.a() || f.b()) == false )
	}

	test("records are erased") {
		assert( (new AQuery("recorded(?,_)", textToTerm(fixName)))()  === false )
	}

	test("record redo") {
		val f = fixture
		fix.redo
		assert( (f.a() && f.b()) == true )
	}
}


class QuerySuite extends FunSuite {
 
 implicit def text2term(s:String):Term = textToTerm(s)

	consult("basic")
	consult("fruit1")
	def fixture =
		new {
			/**val P = new Variable("P")
			val A = new Variable("A")
			val C = new Variable("C") **/
			val q1 = new AQuery("P-A")
			val q2 = new AQuery("A=N*unit(C)")
		}

	val a:Term = "2*unit(adj(red, apple))"

	test("queried for one solution") {
		val f = fixture
		expect(Some(a)) { f.q1.one("A") }
	}

	test("queried for all solutions") {
		val f = fixture
		expect(4) { f.q1.all("P").length }
	}

	test("queried a tuple") {
		val f = fixture
		expect (a) { 
			val Some((_,ga)) = f.q1.one(("P","A"))
			ga
		}
	}

	test("query conjunction") {
		val f = fixture
		expect(Some("adj(red, apple)":Term)) {
			(f.q1 & f.q2).one("C")
		}
	}

	test("query list constructor from query") {
		val f = fixture
		val ql = new QueryList("P-A","A")
		assert(ql.size === 4)
		expect("some(orange)":Term) { ql(2) }
	}

	val ql = new QueryList
	private def mkArray(s:String):Term = 
		stringArrayToList(s.split("").tail)


	test("query on a query list") {
		val aList = listToTermArray(mkArray("abcde"))
		ql ++= aList
		expect(Some(aList.length.toString:Term)) {
			////val N = new Variable("N")
			ql("length",null,"N").one("N")
		}
		expect(termArrayToList(aList.reverse)) {
			////val R = new Variable("R")
			val Some(reversed) = ql("reverse",null,"R").one("R")
			reversed
		}
	}

	test("query on a query list without dummy argument") {
		///val N = new Variable("N")
		intercept[IllegalArgumentException] { ql("length(L,N)","L").one("N") }
	}

}

class ListSuite extends FunSuite {

	import wp._
	import wp.dsl._

	test("Close incremental list") {
		val u = new IncrementalList
		u += "a"
		u += "b"
		expect(2) { u.usize }
		expect(true) {
			u.close
			u.closed
		}
	}

	test("Increment partitions") {
		consult("cli", "fruit2")		
		//val P = new Variable("P")
		val pFruit:Term  = "p(X, fruit, own(john,X))"
		val pOrange:Term = "p(X, orange, own(john,X))"
		val pApple:Term  = "p(X, apple, own(john,X))"
		val cs = new QueryList("find_partition(?,P)","P", pFruit)
		println("Testing list is")
		cs.foreach(c => println("  " + c))
		def vp(p:Term)(t:Term):Feedback = {
			//val Ex = new Variable("Exc")
			val valid = new AQuery("valid_partition(?,?,Ex)",p,t)
			val Some(fb) = valid.one("Ex")
			fb
		}
		val vFruit = new ValidatedIncrementalList(vp(pFruit))
		val vApple = new ValidatedIncrementalList(vp(pApple))
		val vOrange = new ValidatedIncrementalList(vp(pOrange))
		for (c <- cs) {
			println("Testing "+ c)
			expect(Continue) { vFruit.add(c) }
		}
		expect(Ok) { vFruit() }
	}


}

class ProblemSuite extends FunSuite {
	import wp._
	import wp.dsl._
	//implicit def text2term(s:String):Term = textToTerm(s)

	var rauto:RecordedQuery = null

	def fixture = new {
		val find3 = new AQuery("find(_,C,_)")
		val find1 = new AQuery("find(_)")
		val fEqs  = new AQuery("neqs(_)")
		val fSome = new AQuery("_ - some(C)")
	}

	val p = new Problem
	p += "-(p(_3, adj(red, apple), own(john, _3)), *(2, unit(adj(red, apple))))"
	p += "-(p(_4, banana, own(john, _4)), *(3, unit(banana)))"
	p += "-(p(_5, orange, own(john, _5)), some(orange))"
	p += "-(p(_7, fruit, own(john, _7)), *(7, unit(fruit)))"
	p += "find(_9, apple, own(john, _9))"

	 test("create problem") {
	 	val f = fixture
		expect(5) { p.size }
		p.assertAll
		assert( f.find3.all("C").length === 1 )
		assert( f.fSome() === true )
	}

	
	test("make auto and problem complete") {
		val f = fixture
		rauto = p.auto
		rauto()
		expect(true) { p.complete }
		assert( f.find3() === false )
		assert( f.find1() === true  )
		assert( f.fSome() === false )
	} 

	test("undo auto") {
		val f = fixture
		rauto.undo
		//p.retractAll
		assert( f.find3() === true )
		assert( f.find1() === false )
		assert( f.fEqs()  === false )
		assert( f.fSome() === true )
	}

	test("redo auto") {
		val f = fixture
		rauto.redo
		assert( f.find3() === false )
		assert( f.fEqs()   === true )
		assert( f.find1() === true  )
		assert( f.fSome() === false )
		expect(true) { p.complete }
	}

}
