.PHONY: build show stop

WEB_SRV_NAME = docker_intro

all: build

build:
	docker run --rm -v $(CURDIR):/documents/ jmm/asciidoctor asciidoctor --trace -T /asciidoctor-backends/slim/revealjs ./slides.adoc
	@mv slides.html slides.temp
	@sed s/"<video src="/"<video data-autoplay src="/ slides.temp >slides.html
	@rm slides.temp

show: stop
	@docker run -d --name $(WEB_SRV_NAME) -v $(CURDIR):/www -p 80:80 fnichol/uhttpd >/dev/null
	@echo http://localhost:80/slides.html

stop:
	@docker kill $(WEB_SRV_NAME) >/dev/null || :
	@docker rm $(WEB_SRV_NAME) >/dev/null  || :
