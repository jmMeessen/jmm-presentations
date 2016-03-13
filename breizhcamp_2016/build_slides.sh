docker run --rm -v $(pwd):/documents/ jmm/asciidoctor asciidoctor --trace -T /asciidoctor-backends/slim/revealjs ./slides.adoc
