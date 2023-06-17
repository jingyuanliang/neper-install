define delegate
	$(MAKE) -C neper $@ $(foreach target,$^,-o $(target))
endef

all:; $(delegate)

%:; $(delegate)

.PHONY: install
install: tcp_rr tcp_stream tcp_crr udp_rr udp_stream psp_stream psp_crr psp_rr
	install -m 755 $(foreach bin,$^,neper/$(bin)) /usr/local/bin/
