.PHONY: build show stop

WEB_SRV_NAME = techforum_web

all: build

build:
	docker run --rm -v $(CURDIR):/documents/ jmm/asciidoctor asciidoctor --trace -T /asciidoctor-backends/slim/revealjs ./slides.adoc

show: stop
	@docker run -d --name $(WEB_SRV_NAME) -v $(CURDIR):/www -p 81:80 fnichol/uhttpd >/dev/null
	@echo http://localhost:81/slides.html

stop:
	@docker kill $(WEB_SRV_NAME) >/dev/null || :
	@docker rm $(WEB_SRV_NAME) >/dev/null  || :
