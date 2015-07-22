package wp
import prolog._
import jpl.{Term,Variable,Atom}
import jpl.Util._
import scala.collection.mutable.Stack
import scala.collection.JavaConversions._
import jpl.Compound
import scala.tools.jline.console.ConsoleReader

object GfDialog extends Gf("Dialog")


object Tracer {
	import prolog.asserta

	val DEBUG = false
	if (DEBUG) asserta(textToTerm("sdebug"))

	def traceln(s:String) = if (DEBUG) println(s)
}

class Statement(text:String, suffix:String = null) {
		import prolog._
		import java.io.PrintWriter
		
		val trans = new GfProlog(GfDialog,suffix)

		private val parsed:String =
			if (suffix == null)
				text
			else {
				Tracer.traceln("Parsing in " + suffix + ": " + text)
				val trees = GfDialog.parse(suffix,text)
				trees.size match {
						case 1 => trees.head
						case 0 => throw new NoParse(text)
						case 2 => throw new Ambiguous(text)
					}
				}

		private val cores = normalize(trans.toProlog(parsed))

		def abs:String = parsed

		def toLang(sLang:String = suffix) = GfDialog.linearize(parsed,sLang).head

		def core:Array[Term] = cores

		def assert  { cores.foreach(asserta) }

		def retract { cores.foreach(retracta) }

		override def toString:String = "/" + text + "/" + (if (suffix==null) "" else suffix)

		private def format = "%% abs:%s".format(parsed)

		def print {
			println(format)
			cores.foreach(println(_))
		}

		def save(p:PrintWriter) {
			p.println(format)
			if (suffix != null)
				p.println("%% %s:%s".format(suffix,toLang(suffix)))
			cores.foreach(t => p.println(t + "."))
		}
	}
	
	

	object Problem {

		def load(path:String):Problem = {
			import prolog.{consult,consultOne}
			import scala.io.Source.fromFile
			import scala.util.matching.Regex

			val pr = new Problem
			val Abstract = "%\\W*abs:(.*)$".r
			val Concrete = "%\\W*([A-Z]\\w\\w):(.*)$".r
			var cnt:Int = 0
			var current:Statement = null

			def checkCores =
				if (current != null && cnt != current.core.size)
					throw new IllegalArgumentException("Incompatible core statements for %s: (%d != %d)".format(current,current.core.size,cnt))

			consult("basic")
			for (line <- fromFile(path).getLines)
				line match {
					case Abstract(tree)	  =>
						checkCores
						current = new Statement(tree)
						pr += current
						cnt = 0
					case Concrete(l,text) => print(".")
					case e                => cnt += 1
				}
				println("")
				checkCores
			pr
		}		
	}

	class Problem(path:String = null) {
		import scala.collection.mutable.ArrayBuffer
		import prolog.consult
		import java.io._

		consult("basic", "classes")

		var lastRQuery:RecordedQuery = null
		var statements:ArrayBuffer[Statement] = new ArrayBuffer()

		def +=(st:Statement) { statements += st }

		def ++=(sts:ArrayBuffer[Statement]) { statements ++= sts }

		override def toString:String = "Problem with " + statements.size + " statements"

		private def saveTo(filePath:Option[String]) {
			val p:PrintWriter = filePath match {
				case None       => new PrintWriter(System.out)
				case Some(path) => new PrintWriter(new File(path))
			}
			statements.foreach(_.save(p))
			filePath match {
				case None => p.flush
				case _    => p.close 
			}
		}

		def save(p:String = path) {
			if (p == null)
				throw new IllegalArgumentException("save path not defined.")
			saveTo(Some(p))
			println("Saved to '%s'.".format(p))
 		}

		def print { statements.foreach(_.print) }

		def toLang(sLang:String):ArrayBuffer[String] =
			statements.map(_.toLang(sLang))

		def model:Model = {
			consult("linear")
			////val M = new Variable("M")
			val Some(ms) = (new AQuery("model(M)")).one("M")
			new Model(listToTermArray(ms))
		}

		def unknowns:Array[Term] = {
			new AQuery("unknowns(V)").one("V") match {
				case Some(tvars) => listToTermArray(tvars)
				case None        => Array()
			}
		}

		 def assertAll { statements.foreach(_.assert) }
		 def retractAll { statements.foreach(_.retract) }

		def auto {
			consult("auto")
			assertAll
			val define = new RecordedQuery("auto_define")
			val discover = new RecordedQuery("auto_discover")
			val gather = new RecordedQuery("gather_equations")
			val numeric = new RecordedQuery("make_numeric")
			//val aut = define & discover & gather & numeric
			val query = define & discover & gather & numeric
			query()
			lastRQuery = query
		}

		def rollback {
			if (lastRQuery != null) {
				lastRQuery.undo()
				lastRQuery = null
			}
			retractAll
		}

		private def withAutoDo(q:AQuery):Boolean = {
			if (lastRQuery != null)
				throw new IllegalArgumentException("There is a pending rquery.")
			auto
			val result = q()
			rollback
			result
		}

		
		def complete:Boolean =
			withAutoDo(new AQuery("problem_complete"))
		
		def consistent:Boolean = 
			withAutoDo(new AQuery("problem_consistent"))
			
	}



class Goal(t:Term)  {
	
	var nextGoal:Term = t
	var reader:GfConsoleReader = null

	
	def apply(r:GfProlog) {
		//start
		loop(r)
		//finish
	}

	def start {
		val st = new AQuery("start(?,Msg)", nextGoal)
		st.one("Msg") match {
			case Some(msg) => println(msg)
			case None => 
		}
	}

	def finish {
		val fin = new AQuery("finish(?,Msg)", nextGoal)
		fin.one("Msg") match {
			case Some(msg) => println(msg)
			case None => 
		}
	}

	def loop(gp:GfProlog) {
		if (reader == null) reader = gp.getConsole("Command")
		def innerLoop:Option[Term] = {
			val cmd = reader.readLine("? ")
			cmd match {
				case null => None
				case ""   => Some(textToTerm("_"))  // ask for 'help'
				case _    =>
						try
							Some(termArrayToList(gp.transProlog(cmd,"Command")))
						catch {
							case e:IllegalArgumentException => 
								println("No parse.")
								None
							case e:Throwable => 
								println(" Got: " + e)
								throw e
						}
			}
		}
		
		innerLoop match {
			case None 		=> loop(gp)
			case Some(cmd)	=> {
				Tracer.traceln("NEXT GOAL is " + nextGoal + " and cmd is " + cmd)
				val q = new AQuery("%s(?,Out)".format(nextGoal), cmd)
				val Some(resp) = q.one("Out")
				parseResponse(resp) match {
					case Success => {
							println(Success.toNL(gp))
							return
						}
					case resp       => println(resp.toNL(gp))
				}
			}
		}
		loop(gp)
	}


	private def parseResponse(t:Term):Response = {
		Tracer.traceln("RESPONSE: " + t)
		must_define("parseResponse")
		t.name match {
			case "hint"		=> Must(t.arg(1))
			case "example" 	=> Example(t.arg(1), t.arg(2))
			case "already_defined"
							=> Defined(t.arg(1), t.arg(2))
			case "not_covering"
							=> NotCovering(t.arg(1))
			case "incompatible"
							=> Incompatible(t.arg(1))
			case "not_entailed"
							=> NotEntailed
			case "empty"	=> IsEmpty
			case "unrelated"
							=> Unrelated(t.arg(1), t.arg(2))
			case "superclass"
							=> IsSuperClass(t.arg(1), t.arg(2))
			case "inconsistent"
							=> Inconsistent
			case "not_subclass"
							=> NotSubclass(t.arg(1), t.arg(2))
			case "solutions"
							=> Solutions(t.arg(1))
			case "told"     => Told(t.arg(1))

			case "try_again"
							=> TryAgain
			case "true"		=> Success
			case "ok"		=> Ok
			case "none"     => NothingKnown
			case r 			=> throw new IllegalArgumentException("Cannot parse response " + r)  
		}
	}

	abstract class Response {
		def toTerm:Term
		def toNL(gp:GfProlog):String = gp.fromProlog(toTerm,"Feedback")
	}
	
	case class Must(action:Term) extends Response {
		def toTerm = new Compound("hint", Array(action))

		override def toNL(gp:GfProlog):String = action.name match {
				case "gather" => amountsToGather(gp, action)
				case _   	  => super.toNL(gp)
			}

		private def amountsToGather(gp:GfProlog, action:Term):String = {
			val gather: Term = new Compound("gather", Array(action.arg(1)))
			val hint: Term   = new Compound("hint", Array(gather))
			gp.fromProlog(hint,"Feedback") + "\n" +
				listToTermArray(action.arg(2)).map("\t" + gp.fromProlog(_,"Prop")+";").mkString("\n")
		}
	}

	case object Ok extends Response {
		def toTerm = new Atom("ok")
	}

	case object TryAgain extends Response {
		def toTerm = new Atom("try_again")
	}

	case class NotCovering(c:Term) extends Response {
		def toTerm = new Compound("not_covering", Array(c))
	}

	case class Incompatible(t:Term) extends Response {
		def toTerm = new Compound("incompatible", Array(t))
	}

	case object NotEntailed extends Response {
		def toTerm = new Atom("not_entailed")
	}

	case object Inconsistent extends Response {
		def toTerm = new Atom("inconsistent")
	}

	case class NotSubclass(c:Term,d:Term) extends Response {
		def toTerm = new Compound("not_subclass", Array(c,d))		
	}

	case class Unrelated(p:Term,q:Term) extends Response {
		def toTerm = new Compound("unrelated", Array(p,q))
	}

	case class IsSuperClass(c:Term,d:Term) extends Response {
		def toTerm = new Compound("superclass", Array(c,d))
	}

	case object IsEmpty extends Response {
		def toTerm = new Atom("empty")
	}
	
	case class Example(cats:Term, exp:Term) extends Response {
		def toTerm = new Compound("example", Array(cats,exp))
		
		override def toNL(gp:GfProlog) = {

			def subs(c:Term):Term =  {
				if (c.name == "-") {
					gp.random(c.arg(2)) match {
						case Some(e) => new Compound("-", Array(c.arg(1),e))
						case _       =>
							throw new IllegalArgumentException("Cannot give an example for " + c) 
					}
				} else
					throw new IllegalArgumentException("Ill-formed expression in example: " + c) 
			}

			val tryAgain: Term = new Atom("try_again")

			// println("Trying for " + cats)

			val values:Option[Array[Term]] =
				try
					Some(listToTermArray(cats).map(subs))
				catch {
					case e:IllegalArgumentException
							=> None 
					case e:Throwable  => throw e
				}

			// println("Got " + values)
			values match {
				case Some(vs) => 
					// println("It has " + values.size + " entries")
					val example = new Compound("example", Array(termArrayToList(vs),exp))
					val q = new AQuery("make_example(?,Ex)", example)
					q.one("Ex") match {
						case Some(e) => gp.fromProlog(e,"Command")
						case None    =>  gp.fromProlog(tryAgain, "Feedback")
					}
				case None    => gp.fromProlog(tryAgain, "Feedback")
			}
		}
	}

	case class Solutions(sols:Term) extends Response {
		def toTerm = new Compound("solutions", Array(sols))

		override def toNL(gp:GfProlog) = 
			Console.BOLD + listToTermArray(sols).map(gp.fromProlog(_)).mkString("\n") + Console.RESET
	}

	case class Told(t:Term) extends Response {
		def toTerm = new Compound("told", Array(t))

		override def toNL(gp:GfProlog) =
			t.name match {
				case "def" => gp.fromProlog(t)  // variable definition
				case _ =>
					listToTermArray(t).map(gp.fromProlog(_)).mkString("\n")
				/* case _     => 
					throw new IllegalArgumentException("Unimplemented case in 'told': " + t) */
			}
	}

	case object NothingKnown extends Response {
		def toTerm = new Atom("none")
	}

	case object Success extends Response {
		def toTerm = new Atom("ok")
	}

	case class Defined(v:Term, aDef:Term) extends Response {
		def toTerm = new Compound("already_defined", Array(v,aDef))
	}

}

case class SeqConjunction(goals:Term) extends Goal(goals) {
	var subGoals:Array[Term] = listToTermArray(goals)
		
	override def start	{}
	override def finish {}

	override def loop(gp:GfProlog) {
		if (subGoals.isEmpty)
			return
		else {
			nextGoal = subGoals.head
			subGoals = subGoals.tail
			(new Goal(nextGoal))(gp)
			loop(gp)
		}
	}
		
}



class GoalStack extends Stack[Goal] {

	def apply(r:GfProlog) = perform(r)

	def perform(gp:GfProlog) {
		if (!isEmpty) {
			top(gp)
			pop
			perform(gp)
		}
	}

}




class AProblem extends QueryList() {
	import prolog._
	var isAuto:Boolean = false
	val steps:Stack[String] = new Stack()

	def model:Model = {
		consult("linear")
		val Some(ms) = (new AQuery("model(M)")).one("M")
		new Model(listToTermArray(ms))
	}

	def unknowns:Array[Term] = {
		new AQuery("unknowns(V)").one("V") match {
			case Some(tvars) => listToTermArray(tvars)
			case None        => Array()
		}
	}

	def assertAll = forquery("asserta", null)
	def retractAll = forquery("retract", null)


	def complete:Boolean = (new AQuery("problem_complete"))()

	def consistent:Boolean = (new AQuery("problem_consistent"))()

}


class Model(eqs:Array[Term]) extends QueryList() {
	this ++= eqs

	private def showEq(t:Term):String =
		if (t.name == "-" && t.arity == 2)
			showNum(t.arg(1)) + " = " + showNum(t.arg(2))
		else
			throw new IllegalArgumentException("Not an equation.")

	private def reduceBinShow(op:String) = 
		(ts:Array[Term]) => ts.map(showNum).reduceLeft( _ + " " + op + " " + _ )

	private def showNum(t:Term):String =
		if (t.isCompound) 
			t.name match {
				case "sum" 	  => reduceBinShow("+")(listToTermArray(t.arg(1)))
				case "$VAR" => "x" + t.arg(1)
				case _ 		  => t.toString
			}
		else
			t.toString


	def show = foreach(t => println(showEq(t)))


	def solve(vars:Int *):Array[Term] = {
		val tvars = vars.map(n => textToTerm("'$VAR'(%d)".format(n)))
		////val Ss = new Variable("Ss")
		apply("solve_for(?,Ss)",termArrayToList(tvars.toArray)).one("Ss") match {
			case Some(t) => listToTermArray(t) 
			case None    => throw new IllegalArgumentException("Solve failed")
		}
	}

	
}



abstract class Hint
case class Define(amount:Term) extends Hint
case class ClassPartite(amount:Term) extends Hint


abstract class Feedback
case class NotASubclass(d:Term,c:Term) extends Feedback
case class NotDisjoint(d:Term, c:Term) extends Feedback
case class SuperClass(d:Term, c:Term) extends Feedback
case class NotCovering(nc:Term) extends Feedback
case object Continue extends Feedback
case object Empty extends Feedback
case object Ok extends Feedback


object assist {

	def main(args:Array[String]) {

        import wp.prolog.consult

        val hilite = Console.BOLD

        // Start gf server and set language

        val gfs = Gfserver
        val sLang:String = if (args.size >= 2) args(1) else "Eng"

        if (gfs.status) gfs.forceQuit
        gfs.start

        for (s <- Problem.load(args(0)).toLang(sLang))
        	println(hilite + s + Console.RESET)



        consult("basic", "cli", "linear", "classes")
        consultOne(args(0),"./")


        val gp = new GfProlog(GfDialog, sLang)
        val goal = new Goal(textToTerm("interact_many"))
         
        /*  consult("auto")
        	def doAuto(s:String) = (new AQuery("auto_" + s))()
        	doAuto("define")
        	doAuto("discover")
        */
        
        goal(gp)
        gfs.stop
      }
}



object dsl  {
	//import jpl._
	import jpl.Util._
	import prolog._

	implicit def term2hint(t:Term):Hint = t.name match {
		case "hint_define"  => Define(t.arg(1))
		case "hint_partite" => ClassPartite(t.arg(1))
		case _              => throw new IllegalArgumentException("Not a hint: " + t) 
	}

	implicit def term2Array(t:Term):Array[Term] = listToTermArray(t)
	implicit def arrayTerm2term(ts:Array[Term]):Term = termArrayToList(ts)
	implicit def string2Term(s:String):Term = textToTerm(s)


	def start() { Gfserver.start }
	def stop()  { Gfserver.stop }

	class IncrementalList extends QueryList() {
		val symbTail:Term = new Variable("Tail")
		val nil:Term = new Atom("[]")
		this += symbTail

		def closed = { this(0) == nil }
		
		def usize = size  - 1

		override def toString = 
			"<%s list of %d items>".format(
				if (closed) "closed" else "open",
				usize)

		//def +=(t:Term):Boolean = { this += t ; true} 

		def close = { this(0) = nil }

	}


	class ValidatedIncrementalList(validate:Term => Feedback)
	extends IncrementalList {
		import scala.collection.mutable.ArrayBuffer

		private var fb:Feedback = null
		
		private val rValidate = (ts:ArrayBuffer[Term]) => validate(arraybufferTerm2term(ts))

		def add(t:Term):Feedback = {
			val augContent = this.clone()
			augContent += t
			fb = rValidate(augContent)
			fb match {
				case Continue => this += t 
				case _        =>
			}
			fb
		}

		def apply():Feedback = {
			super.close
			fb = rValidate(this)
			fb
		}

		def feedback:Feedback = fb

	}

	

	class StatementFactory(sLang:String) {

		def read:Statement = {
			val reader = new GfConsoleReader(sLang,GfDialog)
			val text = reader.readLine(sLang + ": ")
			if (text != null)
				new Statement(text,sLang)
			else
				throw new IllegalArgumentException("No text")
		}

	}

	

	


	def test1:Problem = {
		import wp.prolog.consult
		consult("basic")
		val l = "Eng"
		val p = new Problem("foo.pl")
		p += new Statement("John has seven fruit .", l)
		p += new Statement("John has two apples , some oranges and three bananas .", l)
		p += new Statement("how many oranges does John have ?", l)
		p
	}


	/* Doing and undoing of recorded queries */
	def test2:Problem = {
		val p = Problem.load("foo.pl")
		consult("basic", "auto")
		val define = new RecordedQuery("auto_define")

		def check {
			println("There are " + (new AQuery("section(S)")).all("S").size + " sections.")
			println("some orange? " + (new AQuery("_-some(orange)"))() )
			println("find oranges? " + (new AQuery("find(X, orange, own(john,X))"))() )
			println("find CORE? " + (new AQuery("find(_)"))() )
		}

		p.assertAll
		check
		define()
		check
		define.undo()
		check
		p.retractAll
		p
	}

	/* Make a problem inconsistent by adding an incompatible statement */
	def test3:Problem = {
		val p = Problem.load("foo.pl")
		p += new Statement("John has one banana .", "Eng")
		p
	}
}