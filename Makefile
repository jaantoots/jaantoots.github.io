md = $(wildcard *.md)
ALL = $(md:.md=.html)

.PHONY: all
all: $(ALL)

META = '<meta name="viewport" content="width=device-width">'
ICON = '<link rel=icon href=data:,>'
STYLE = '<style>body {max-width: 70ch; padding: 2ch; margin: auto;}</style>'
%.html: %.md
	mkd2html -header $(META) -header $(ICON) -header $(STYLE) $<

.PHONY: deploy
deploy:
	rclone sync -I -P --include '**.{md,html,asc}' . fm:public/

.PHONY: clean
clean:
	-rm $(ALL)
