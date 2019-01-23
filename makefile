CC = xelatex
OUTPUT_DIR = .
IMG_DIR = img

main: cv.pdf cv.jpg

%.pdf: %.tex data/*.tex
	$(CC) -output-directory=$(OUTPUT_DIR) $<
	$(CC) -output-directory=$(OUTPUT_DIR) $<

%.jpg: %.pdf 
	@convert -density 300 $< -quality 70 $(IMG_DIR)/$@
	@ls *.jpg | awk '{print $1}' > $(IMG_DIR)/README.md

clean:
	$(RM) *.out *.aux *.log *.fdb_latexmk *.fls

clear: clean
	$(RM) *.pdf $(IMG_DIR)/*
