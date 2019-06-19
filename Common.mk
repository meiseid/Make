include ${MAKETOP}/${MKLANG}.mk

CC_INC	+=	-I/usr/local/include -I/usr/include/postgresql
LD_LIBS	+=	-L/usr/local/lib

MAKEFILE		=	Makefile
CP				=	cp
MV				=	mv
RM				=	rm
SED				=	sed
GREP			=	grep
TOUCH			=	touch
LD				=	${CC}
LDFLAGS			=	${CC_DBG}
LD_LIBS			+=
LIB_DL			=
DEP				=	${CC}
DEPFLAGS		=	-M ${CC_INC} -D_GNU_SOURCE
INSTALL			=	install
INSTALLFLAGS	=	-C
INSTALLOBJ		=	${INSTALL} ${INSTALLFLAGS}
INSTALLEXE		=	${INSTALLOBJ} ${STRIP_OPT}
INSTALLBIN		=	${INSTALLOBJ}
INSTALLDAT		=	${INSTALLOBJ} -m 0644
AR				=	ar
ARFLAGS			=	ruv
RANLIB			=	ranlib
RANLIBFLAGS		=
SO				=	${LD}
SOFLAGS			=	${LDFLAGS} -shared

CFLAGS	=	-D_GNU_SOURCE ${CC_OPT} ${CC_DBG} ${CC_INC}
CXXFLAGS	=	${CFLAGS}

all::	${TARGET}

depend::
	@(${SED} -e '/^# DO NOT/,$$d' ${MAKEFILE} ; \
	echo '# DO NOT DELETE THIS LINE' ; \
	${DEP} ${DEPFLAGS} ${SRCS}) > ${MAKEFILE}.new
	@${TOUCH} -r ${MAKEFILE} ${MAKEFILE}.new
	@${MV} -f ${MAKEFILE}.new ${MAKEFILE}
	${DEP} ${DEPFLAGS} ${SRCS}

clean::
	-${RM} -f ${TARGET}
	-${RM} -f ${OBJS}
	-${RM} -f *~
	-${RM} -f *.bak
	-${RM} -f core
	-${RM} -f *.core
	-${RM} -f core.*
	-${RM} -f *.ln
	-${RM} -f ._*
	-${RM} -f .DS_Store
	@${SED} -e '/^# DO NOT/,$$d' ${MAKEFILE} > ${MAKEFILE}.new
	@${TOUCH} -r ${MAKEFILE} ${MAKEFILE}.new
	@${MV} -f ${MAKEFILE}.new ${MAKEFILE}

install::	all
	@if [ x${DESTDIR} != x ]; then \
		command="${INSTALLCOM} ${TARGET} ${DESTDIR}"; \
		echo $$command; $$command; \
		bins="${BINS}"; for bin in $$bins; do \
			command="${INSTALLBIN} $$bin ${DESTDIR}"; \
			echo $$command; $$command; \
		done; \
	fi
	@if [ x${DESTINC} != x ]; then \
		incs="${INCS}"; for inc in $$incs; do \
			command="${INSTALLDAT} $$inc ${DESTINC}"; \
			echo $$command; $$command; \
		done; \
	fi
	@if [ x${DESTDOC} != x ]; then \
		docs="${DOCS}"; for doc in $$docs; do \
			command="${INSTALLDAT} $$doc ${DESTDOC}"; \
			echo $$command; $$command; \
		done; \
	fi

uninstall::
	-@if [ x${DESTDIR} != x ]; then \
		command="${RM} -f ${DESTDIR}/${TARGET}"; \
		echo $$command; $$command; \
		bins="${BINS}"; for bin in $$bins; do \
			command="${RM} -f ${DESTDIR}/$$bin"; \
			echo $$command; $$command; \
		done; \
	fi
	-@if [ x${DESTINC} != x ]; then \
		incs="${INCS}"; for inc in $$incs; do \
			command="${RM} -f ${DESTINC}/$$inc"; \
			echo $$command; $$command; \
		done; \
	fi
	-@if [ x${DESTDOC} != x ]; then \
		docs="${DOCS}"; for doc in $$docs; do \
			command="${RM} -f ${DESTDOC}/$$doc"; \
			echo $$command; $$command; \
		done; \
	fi
