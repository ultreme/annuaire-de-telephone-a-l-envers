all: book.md

STD_OUTPUTS = \
	book.asciidoc \
	book.db \
	book.docx \
	book.epub \
	book.html \
	book.json \
	book.opml \
	book.org \
	book.rst \
	book.rtf \
	book.tex \
	book.text \
	book.textile \
	book.icml


CUSTOM_OUTPUTS =


DISABLED_OUTPUTS = \
	book.odt \
	book.pdf


all: $(STD_OUTPUTS) $(CUSTOM_OUTPUTS)


clean:
	rm -f $(STD_OUTPUTS) $(CUSTOM_OUTPUTS) $(DISABLED_OUTPUTS)

book.odt: book.md
	@rm -f tmp-$@
	pandoc +RTS -Ksize -RTS $< -o tmp-$@
	@mv tmp-$@ $@


$(STD_OUTPUTS): book.md
	@rm -f tmp-$@
	pandoc $< -o tmp-$@
	@mv tmp-$@ $@

book.md:
	go run main.go > book.md

wopnum.xls:
	wget http://www.arcep.fr/fileadmin/wopnum.xls

wopnum.csv: wopnum.xls
	xls2csv $<
