import java.sql.*; // JDBC stuff.
import java.util.Properties;
import java.util.Scanner;
import java.io.*;  // Reading user input.
import org.grammaticalframework.pgf.*;

public class GFSQLShell
{

    public static void main(String[] args) throws Exception
    {
            Class.forName("org.postgresql.Driver");     // postgresql server address

            String url = "jdbc:postgresql:Countries";   // database name

            Properties props = new Properties();
            props.setProperty("user","aarne") ;         // your username
            props.setProperty("password","") ;          // your password
	    
            Connection conn = DriverManager.getConnection(url, props);

            Console console = System.console();
	    
            System.out.println("Welcome!");

	    PGF pgf = PGF.readPGF("Countries.pgf") ;

	    Concr sql = pgf.getLanguages().get("CountriesSQL");

	    String lang = args[0] ;
	    Concr from = pgf.getLanguages().get("Countries" + lang) ;
	    
            while(true) {
                String query = console.readLine("? > ") ;
                makeQuery(conn, translateQuery(pgf,from,sql,query)) ;
            }
    }
    
    static void makeQuery(Connection conn, String query) throws SQLException
    {
	Statement st = conn.createStatement();
        ResultSet rs = st.executeQuery(query) ;

	int last =  rs.getMetaData().getColumnCount() ;
        while (rs.next()) {
	    for (int i = 1 ; i <= last-1 ; i++)
		System.out.print(rs.getString(i) + " ") ;
	    System.out.println(rs.getString(last)) ;
        }
	
        rs.close();
        st.close();
    }

    static String translateQuery(PGF pgf, Concr from, Concr to, String input) throws ParseError
    {
	String output = "parse error" ;

	for (ExprProb ep : from.parse(pgf.getStartCat(),input)){
	    Expr tree = ep.getExpr() ;
	    output = to.linearize(tree) ;
	}
	
	output = cleanSQL(output) ;
	System.out.println(output) ;
	return output ;
    }

    static String cleanSQL(String input)
    {
	return input ;
    }
}

/*
to compile: javac -cp .:java GFSQLShell.java
to run:     java -Djava.library.path=/usr/local/lib/ -cp .:postgresql-9.4.1207.jre6.jar:java GFSQLShell

JPGF documentation:      http://www.grammaticalframework.org/doc/java-api/index.html
ResultSet documentation: http://docs.oracle.com/javase/7/docs/api//index.html?java/sql/ResultSet.html
jdbc jar file:           https://jdbc.postgresql.org/download.html
postgres-jdbc doc:       https://jdbc.postgresql.org/documentation/head/index.html
 */
