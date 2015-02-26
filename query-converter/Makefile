all: executable

executable:
	ghc --make -o qconv QConv.hs

test:
	echo "d edu.txt" | ./qconv
	echo "i course.sql" | ./qconv

