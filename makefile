CC = xelatex
OUTPUT_DIR = .

main:	cv.pdf

%.pdf: %.tex
	$(CC) -output-directory=$(OUTPUT_DIR) $<

clean:
	$(RM) *.out *.aux *.log

clear: clean
	$(RM) *.pdf
