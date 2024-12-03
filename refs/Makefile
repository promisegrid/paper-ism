# convert all *.pdf files to *.txt files
allPdfFiles = $(wildcard *.pdf)
allTxtFiles = $(patsubst %.pdf,%.txt,$(allPdfFiles))

all: $(allTxtFiles)

%.txt: %.pdf
	pdftotext $<
