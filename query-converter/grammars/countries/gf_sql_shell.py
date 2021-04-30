import psycopg2
from pgf import *

database_name = 'countries'
pgf_name = 'Countries'
cnc_eng = pgf_name + "Eng"
cnc_sql = pgf_name + "SQL"

def main():
    grammar = readPGF(pgf_name + '.pgf')
    lang = grammar.languages[cnc_eng]
    sql = grammar.languages[cnc_sql]
    
    conn = psycopg2.connect("dbname=" + database_name)
    cur = conn.cursor()

    line = input("# ")
    while (line != "q"):
        parseresult = lang.parse(line)
        prob,tree = parseresult.__next__()
        statement = sql.linearize(tree)
        cur.execute(statement)
        rows = cur.fetchall()
        for row in rows:
            print ('\t'.join([str(cell) for cell in row]))
        line = input("# ")
    print('bye')

main()

