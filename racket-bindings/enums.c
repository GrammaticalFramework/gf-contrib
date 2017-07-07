#include <gu/variant.h>
#include <gu/map.h>
#include <gu/enum.h>
#include <gu/file.h>
#include <pgf/pgf.h>
#include <pgf/data.h>
#include <pgf/literals.h>
#include <pgf/linearizer.h>
#include <pgf/expr.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

PgfExprProb* next_exp(GuPool* pool, GuEnum* result) {
    return gu_next(result, PgfExprProb*, pool);
}
