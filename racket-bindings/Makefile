CRUNTIME_LIBS=../c/.libs
CRUNTIME_INCLUDE=../c

enums.dylib: enums.c
	gcc -I $(CRUNTIME_INCLUDE) -L $(CRUNTIME_LIBS) -l gu -l pgf -dynamiclib  -undefined suppress -flat_namespace  -o $@ $^

pgf.dylib: pgf-test.c
	gcc -I $(CRUNTIME_INCLUDE) -L $(CRUNTIME_LIBS) -l gu -l pgf -dynamiclib  -undefined suppress -flat_namespace  -o $@ $^

test: pgf-test.c
	gcc -I $(CRUNTIME_INCLUDE) -L $(CRUNTIME_LIBS) -l gu -l pgf -o $@ $^
