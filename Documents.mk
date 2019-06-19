DESTDIR			=	${DESTDOC}
INSTALL			=	install
INSTALLFLAGS	=	-C
INSTALLOBJ		=	${INSTALL} ${INSTALLFLAGS}
INSTALLBIN		=	${INSTALLOBJ}
INSTALLDAT		=	${INSTALLOBJ} -m 0644
RM				=	rm

all depend clean lint::

install::	all
	@if [ x${DESTDIR} != x ]; then \
		bins="${BINS}"; for bin in $$bins; do \
			command="${INSTALLBIN} $$bin ${DESTDIR}"; \
			echo $$command; $$command; \
		done; \
		docs="${DOCS}"; for doc in $$docs; do \
			command="${INSTALLDAT} $$doc ${DESTDIR}"; \
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
		docs="${DOCS}"; for doc in $$docs; do \
			command="${RM} -f ${DESTDIR}/$$doc"; \
			echo $$command; $$command; \
		done; \
	fi
