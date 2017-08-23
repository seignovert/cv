CC = xelatex
OUTPUT_DIR = .

main: cv.pdf

%.pdf: %.tex data/*.tex
	$(CC) -output-directory=$(OUTPUT_DIR) $<

clean:
	$(RM) *.out *.aux *.log *.fdb_latexmk *.fls

clear: clean
	$(RM) *.pdf
