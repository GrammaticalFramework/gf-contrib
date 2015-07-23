AC_INIT([wproblems], [0.1])
AC_ARG_VAR([JPL_LIBDIR], [path to the jpl.jar file])
AC_ARG_VAR([SWIPL_LIBDIR], [path to the swi-prolog library])
AC_SUBST([classpath], ".:lib/*:$JPL_LIBDIR/jpl.jar")
AC_SUBST([java_opts], "-Djava.library.path=.:$SWIPL_LIBDIR")
AC_CONFIG_FILES([Makefile])
AC_CONFIG_FILES([model], [chmod +x model])
AC_CONFIG_FILES([create], [chmod +x create])
AC_OUTPUT
