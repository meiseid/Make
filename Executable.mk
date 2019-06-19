include ${MAKETOP}/Common.mk
DESTDIR			=	${DESTEXE}
INSTALLCOM		=	${INSTALLEXE}

${TARGET}::	${OBJS} ${LIBS}
	${LD} ${LDFLAGS} -o $@ ${OBJS} ${LIBS} ${LD_LIBS}
