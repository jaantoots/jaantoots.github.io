md = $(wildcard *.md)
ALL = $(md:.md=.html)
CSS = normalize.css sakura-dark.css

.PHONY: all
all: $(ALL)

%.html: %.md $(CSS)
	mkd2html -header '<meta name="viewport" content="width=device-width, initial-scale=1.0">' \
		$(addprefix -css ,$(CSS)) $<

.PHONY: deploy
deploy:
	rclone sync -I -P --include '**.{md,html,css,asc}' . fm:public/

.PHONY: clean
clean:
	-rm $(ALL)
