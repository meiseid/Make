include ${MAKETOP}/Common.mk
DESTDIR			=	${DESTLIB}
INSTALLCOM		=	${INSTALLEXE}

${TARGET}::	${OBJS}
	${SO} ${SOFLAGS} -o $@ ${OBJS}
