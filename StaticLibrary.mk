include ${MAKETOP}/Common.mk
DESTDIR			=	${DESTLIB}
INSTALLCOM		=	${INSTALLDAT}

${TARGET}::	${OBJS}
	@if [ x"$?" != x"" ]; then set -x; ${AR} ${ARFLAGS} $@ $? ; fi
	@if [ x${RANLIB} != x ]; then set -x; ${RANLIB} ${RANLIBFLAGS} $@ ; fi
