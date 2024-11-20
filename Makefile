all: loop

loop:
	 watch-run "asciidoctor -v README.adoc" README.adoc 

