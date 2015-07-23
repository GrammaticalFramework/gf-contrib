package wp
import java.util._
import java.io._
import scala.collection.JavaConversions._
import scala.tools.jline.console.completer._
import scala.tools.jline.console.ConsoleReader


case class NoParse(which:String) extends Exception(which)
case class Ambiguous(which:String) extends Exception(which)


object Gfserver {
	import scala.sys.process._
	//import scala.sys.

	val buffer = new StringBuffer()
	private var proc:Process = null

	def start () {
	  	val pio = new ProcessIO(in => (), out => (), err => ())
	  	val pb = Process("gf --server --document-root .", None, "GF_RESTRICTED" -> "yes")
	  	proc = pb.run(pio) // lines_! ProcessLogger(buffer append _)
	}

	def status():Boolean  = 
		Process("ps -axo command").lines.exists(_ contains "gf --server")


	def forceQuit() {
		println("Stopping all gf services.")
		"killall gf".!
	}
		

	def stop () {
		if (proc == null)
			throw new IllegalArgumentException("No gf process running")
		else {
			proc.destroy
			proc = null
		}
	}

	def restart() {
		if (proc != null) stop
		start
	}

}




class GfConsoleReader(sLang:String,gf:Gf, cat:String = null) extends ConsoleReader() {
	val category = if (cat == null) gf.startcat else cat
	// val Some(lang) = gf.getLanguage(sLang)

	addCompleter(new GfCompleter(gf,category,sLang))

	def parse(text:String):Set[String] = gf.parse(sLang,text,category)

	class GfCompleter(gf:Gf, category:String, sLang:String) extends Completer {
		def complete(buffer:String, cursor:Int, candidates:List[CharSequence]):Int = {
			//println("Called completer with buffer=" + buffer + ", cursor=" + cursor)
			gf.complete(sLang,buffer,category).foreach(candidates.add(_))
			val rel = buffer.lastIndexOf(" ")
			if (candidates.size ==0) -1 else rel + 1
		}
	}

}


object test  {

	val reader = new GfConsoleReader("Eng", new Gf("AllProblems"), "Amount")

	def run() {
		val text = reader.readLine
		println("Got: '%s'".format(text))
		val parsed = reader.parse(text)
		parsed.size match {
			case 1 => println("Parsed as '%s'".format(parsed.head))
			case 0 => println("No parse.")
			case _ => println("It is ambiguous.") 
		}
	}

}



class Gf(gfModuleName:String) {
	import java.net.URI
	import ch.uzh.ifi.attempto.gfservice.gfwebservice.GfWebService
	import ch.uzh.ifi.attempto.gfservice._
	val uri = new URI("http://localhost:41296")
	//val startcat = "Prop"
	private val gf = new GfWebService(uri,
			String.format("/grammars/%s.pgf", gfModuleName))
	private val grammar = gf.grammar

	def capitalCase(l:String):String = 
		l.substring(0,1).toUpperCase + l.substring(1,l.length).toLowerCase

	def getShortLang(lang:String):Option[String] =
		getLanguage(lang) match {
			case Some(l) => Some(l.substring(l.length-3,l.length))
			case _		 => None 
		}

	private def getLanguage(l:String):Option[String] = {
		val sLang = capitalCase(l)
		for (lang <- grammar.getLanguages.keys.filter(l => l.endsWith(sLang)))
			return Some(lang)
		None
	}

	def linearize(tree:String, sLang:String):Set[String] = {
			val Some(lang) = getLanguage(sLang)
			val result:GfServiceResultLinearize = gf.linearize(tree,lang)
			result.getTexts(lang)
		}

	def startcat:String = grammar.getStartcat

	def complete(sLang:String, text:String, cat:String = startcat):Set[String] = {
		val Some(lang) = getLanguage(sLang)
		val result:GfServiceResultComplete = gf.complete(cat, text, lang, null)
		result.getCompletions(lang)
	}

	def parse(sLang:String, text:String, cat:String = grammar.getStartcat):Set[String] = {
		val Some(lang) = getLanguage(sLang)
		gf.parse(cat, text, lang).getTrees(lang)
	}
		

	def translate(fromSLang:String, toSLang:String, text:String, cat:String = grammar.getStartcat) = {
			val Some(lang1) = getLanguage(fromSLang) 
			val Some(lang2) = getLanguage(toSLang) 
			gf.translate(cat, text, lang1, lang2).getTranslations(lang1)
	}
	def random(cat:String, limit:Int = 1):List[String] = {
		import scala.actors.Futures._

		def runWithTimeout[T](timeoutMs: Long)(f: => T) : Option[T] = {
   			 awaitAll(timeoutMs, future(f)).head.asInstanceOf[Option[T]]
  		}

		val trees = awaitAll(2000, future({
				//println("GF: Entering random with " + cat)
				val result:GfServiceResultRandom = gf.random(cat,limit)
				// println("GF: got " + result)
				result.getTrees
				})).head.asInstanceOf[Option[List[String]]]

		trees match {
			case Some(ts) => ts
			case _        => {
					println("GF TIMEOUT: Restarting")
					Gfserver.stop
					Gfserver.start
					Thread.sleep(1000)
					new ArrayList()
				}
		}
		
	}


}

class GfProlog(gf:Gf,sLang:String) {

	import jpl.{Term,Variable,Query}
	import jpl.Util._

	/* val Some(nlLang) = gf.getLanguage(sLang)
	val Some(plLang) = gf.getLanguage("Prolog") */

	val plLang = "Prolog"

	def getConsole(cat:String = gf.startcat):GfConsoleReader
		= new GfConsoleReader(sLang,gf,cat)

	private def plUnlex(text:String):String = {
		val Unlexer = """((\[\])|('\.'\()|(\*\()|(\+\()|([$'\w]+\(?)|,|\))\s*""".r
		Unlexer.findAllIn(text).mkString(" ")
	}

	private def nlLex(text:String):String = 
		text.replaceAll("([\\.?,])(\\W|$)"," $1 ")


	def toProlog(tree:String, cat:String = gf.startcat):Term = 
		textToTerm(gf.linearize(tree, plLang).head)


	def transProlog(text:String, cat:String = gf.startcat):Array[Term] = {
		// val lins = gf.translate(nlLang, plLang, nlLex(text), cat).toArray
		val parseTrees = gf.parse(sLang, nlLex(text), cat)
		if (parseTrees.size == 0) 
				throw new IllegalArgumentException("No parse for " + text)
		else
			parseTrees.map(toProlog(_,cat)).toArray
	}


	def fromProlog(term:Term, cat:String = null):String = {
		val unlexed = plUnlex(term.toString)
		val lins = if (cat == null)
						gf.translate(plLang, sLang, unlexed)
					else
						gf.translate(plLang, sLang, unlexed, cat)
		if (lins.size == 0)
			throw new NoParse(unlexed)
		else if (lins.size > 1)
			throw new Ambiguous(term.toString)
		else
			lins.toArray()(0).toString
	}

	def disambiguate(ts:Set[String]):Option[String] = {
		ts.size match {
			case 1 => Some(ts.head)
			case _ => println("Ambiguous. Taking first of %d".format(ts.size)) 
					  Some(ts.head) 
		}
		
	}

	def random(cat:Term):Option[Term] = {
		val gfcat = gf.capitalCase(cat.toString) 
		val ts = gf.random(gfcat, 1)
		if (ts.size >= 1) {
			//println("Got: " + ts)
			val lin:String = gf.linearize(ts.head,plLang).head
			//println("Lin: " + lin)
			if (lin == "") None
			else Some(textToTerm(lin))
		} else None
	}

}