CC = xelatex
OUTPUT_DIR = .
OUT_JPG = cv/

main: readme

%.pdf: %.tex data/*.tex
	$(CC) -output-directory=$(OUTPUT_DIR) $<
	$(CC) -output-directory=$(OUTPUT_DIR) $<

%.jpg: %.pdf
	@echo "Convert $< to jpg images in $(OUT_JPG)"
	@mkdir -p $(OUT_JPG)
	@convert -density 300 $< -quality 70 $(OUT_JPG)$@

readme: cv.jpg
	@echo "Create a README in $(OUT_JPG)"
	@ls $(OUT_JPG)*.jpg | xargs -n1 basename | awk '{print "!["$$1"]("$$1")"}' > $(OUT_JPG)README.md

clean:
	$(RM) *.out *.aux *.log *.fdb_latexmk *.fls

clear: clean
	$(RM) *.pdf $(OUT_JPG)*
