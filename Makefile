tex := $(wildcard *.tex)
ALL := $(tex:.tex=.pdf) $(tex:.tex=.html)

.PHONY: all
all: $(ALL)

%.pdf: %.tex
	latexmk -pdf $<

%.html: %.tex sakura.cfg
	htlatex $< "sakura,charset=utf-8" " -cunihtf -utf8"

.PHONY: deploy
deploy:
	rclone sync -I -P --include '**.{tex,pdf,html,css,md,cfg}' . fm:public/

.PHONY: clean
clean:
	-rm $(ALL)
