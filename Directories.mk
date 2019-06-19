all depend install uninstall clean::
	@dirs="${SRCS}"; for dir in $$dirs; do \
		(set +x; cd $$dir; ${MAKE} ${MFLAGS} $@); \
	done
