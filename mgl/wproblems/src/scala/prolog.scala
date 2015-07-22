package wp
import scala.collection.JavaConversions._
import scala.collection.mutable.ArrayBuffer
import java.util.Hashtable
import jpl.Util._
import jpl._




trait Group[T] {
	val zero:T
	def inverse(g:T):T
	def compose(g1:T,g2:T):T
}


object prolog {

	val DEBUG = false
	val DATAPATH = "data/"

	def traceln(s:String) = if (DEBUG) println(s)

	// Only for debugging
	def must_define(when:String) {
		if (DEBUG) { // Not used
			val dfd = new AQuery("must_define(X)")
			dfd.one("X") match {
				case Some(p) => println(when + ": Must define" + p)
				case None    => println(when + ": All defined") 
			}
		}
	}


	def uncore(term:Term):Term = {
		val u = new Variable("U")
		val q = new Query(transform("unnormal", u, term))
		if (q.hasSolution)
			getValue(q.oneSolution, u)
		else
			throw new IllegalArgumentException("Cannot uncore " + term)
	}

	def consultOne(modname:String, path:String) {
		val fname = path + modname
		val q = new Query("load_files('%s',[silent(true)])".format(fname))
		if (!q.hasSolution) 
			throw new IllegalArgumentException("Cannot consult " + fname)	
	}

	def consult(filenames:String *) {
		for (fn <- filenames) {
			consultOne(fn,DATAPATH)
		}
	}

	private def stringTable(solution:Hashtable[_,_]):Hashtable[String,Term] =
		solution.asInstanceOf[Hashtable[String,Term]]

	private def getValue(solution:Hashtable[_,_], v:Variable):Term =
		stringTable(solution).get(String.valueOf(v))

	def asserta(t:Term) {
		val q = new Query(
			new Compound("asserta", Array(t)))
		if (!q.hasSolution)
			throw new IllegalArgumentException("Cannot assert.")
		traceln("Asserted " + t)
	}

	def retracta(t:Term) {
		val q = new Query(
			new Compound("retract", Array(t)))
		if (!q.hasSolution)
			throw new IllegalArgumentException("Cannot retract " + t)
		traceln("Retracted " + t)
	}

	def transform(h:String, v:Variable, t:Term):Term = {
		val args: Term = new Compound(";",Array[Term](t, v));
		new Compound(h, Array(args))
	}


	def normalize(term:Term):Array[Term] = {
		val ns = new Variable("Ns")
		val q = new Query(transform("normal", ns, term))
		if (q.hasSolution) {
			listToTermArray(getValue(q.oneSolution, ns))
		} else
			throw new IllegalArgumentException("No normal terms for " + term)
	}


	class AQuery(head:String,args:Term*) {
		val query =
			if (args.isEmpty)
				new Query(head)
			else
				new Query(head,args.toArray)
		var allSols:Array[Hashtable[String,Term]] = null
		var oneSol:Option[Hashtable[String,Term]] = null

		def rewind = {
			traceln("Query " + query + "is rewound") 
			query.rewind }

		override def toString:String = query + "?"


		private def getAll {
			if (allSols != null) return
			if (oneSol != null) query.rewind
			allSols = query.allSolutions.map(stringTable)
		}

		def all(rVar:String):Array[Term] = {
			getAll
			//// val sVar = rVar.toString
			/** println("Find all for " + query)
			println("Gives ")
			allSols.foreach(println) **/
			allSols.map(_.get(rVar))
		}

		def all(rv12:(String,String)):Array[(Term,Term)] = {
			getAll
			////val (rv1,rv2) = rv12
			val (s1,s2) = rv12 ////(rv1.toString,rv2.toString)
			allSols.map(t => (t.get(s1),t.get(s2)))
		}

		private def getOne {
			if (oneSol != null) return
			if (allSols != null) query.rewind
			//if (query.hasSolution) {
			try {
			/* DO NOT ask hasSolution and then oneSolution:
			   the latter remakes the query */
				oneSol = Some(stringTable(query.oneSolution))
			} catch {
				case ex:Throwable => println("oneSolution exception: " + ex)
				oneSol = None
			}
			//} else
			//	oneSol = None
		}

		def one(rVar:String):Option[Term] = {
			getOne			
			oneSol.map(_.get(rVar))
		}

		def one(rv12:(String,String)):Option[(Term,Term)] = {
			val (s1,s2) = rv12
			/** val s1 = rv1.toString
			val s2 = rv2.toString **/
			getOne
			oneSol.map(s => (s.get(s1), s.get(s2)))
		}

		protected def asTerm:Term = 
			if(args.isEmpty)
				textToTerm(head)
			else
				new Compound(head, args.toArray)

		def &(other:AQuery):AQuery = {
			new AQuery(",", asTerm, other.asTerm)
		}

		def |(other:AQuery):AQuery = {
			new AQuery(";", asTerm, other.asTerm)
		}

		def apply():Boolean = query.hasSolution
	}


	class RQuery extends ArrayBuffer[PrimitiveRQ] {

		def inverse:RQuery = {
			val rq = new RQuery
			rq ++= reverse.map(_.inverse())
			rq
		}

		def ++(other:RQuery):RQuery = {
			val rq = new RQuery
			rq ++= this ++ other
			rq
		}

		def perform() = foreach(_())
	}
	
	
	abstract class PrimitiveRQ(h:String,args:Term *) {
		def inverse():PrimitiveRQ

		def apply():Boolean = { 
			val q = new AQuery(h,args:_*)
			//println("APPLYING " +q)
			q()
		}
	}
	case class Assert(clause:Term) extends PrimitiveRQ("asserta",clause) {
		def inverse() = Retract(clause)
	}
	case class Retract(clause:Term) extends PrimitiveRQ("retract",clause) {
		def inverse() = Assert(clause)
	}


	class RecordedQuery(head:String,args:Term *) extends AQuery(head,args:_*) {

		var records:RQuery = null

		private def parse(t:Term):PrimitiveRQ =
			t.name match {
				case "add" => Assert(t.arg(1))
				case "rm"  => Retract(t.arg(1))
				case _     => throw new IllegalArgumentException("no record parsing for " + t)
			}


		/* It ERASES the records in the prolog database
   		   AND the sections */ 
		private def getRecords:RQuery = { 
			consult("basic")
			val actions = new RQuery
			val secs = new AQuery("section(S)")
			for (sec <- secs.all("S")) {
				traceln("Section " + sec)
				val rec = new AQuery("erase_recorded(?,T)", sec)
				actions ++= rec.all("T").map(parse)
				(new AQuery("rm_tag(?)",sec))()
			}
			actions
		}
		
		def &(other:RecordedQuery):RecordedQuery =
			new RecordedQuery(",", this.asTerm,other.asTerm)


		def undo() = {
			if (records == null) records = getRecords
			traceln("Undoing " + records)
			records.inverse.perform 
		}

		def redo() = {
			if (records == null) records = getRecords
			records.perform
		}
	}



	class QueryList(consQuery:String, rVar:String, args:Term *) extends ArrayBuffer[Term] {

		if (consQuery != null) {
			val consQ = new AQuery(consQuery,args:_*)
			this ++= consQ.all(rVar) 
		}

		def this() = this(null, null)

		//private def asReversed:Term = arraybufferTerm2term(this)

		private def solveQuery(query:String):Boolean =
			(new Query(query)).hasSolution


		def asProlog = foreach(t => println(t +"."))

		private def insertArg[T](elem:T,ts:Seq[T]):Seq[T] =
			ts.indexOf(null) match {
				case -1 => throw new IllegalArgumentException("No dummy argument")
				case n  => ts.updated(n,elem)
			}
		
		def apply(query:String,ts:Term *):AQuery = {
			val contents = termArrayToList(this.toArray)
			new AQuery(query, insertArg(contents,ts):_*)
		}

		def forquery(query:String,ts:Term *):Boolean = {
			for (e <- this) {
				// println("for " + e + " do " + query)
				if (!(new AQuery(query,insertArg(e,ts):_*))())
					return false
			}
			true // All succeeded
		}
	}

	def arraybufferTerm2term(ts:ArrayBuffer[Term]):Term = (ts(0) /: ts.tail) { (b,a) => new Compound(".", Array(a,b)) }


}