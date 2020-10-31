vpath %.html html

CSS = main.css

.PHONY: all
all: index.html posts
	cp -t html $(CSS)

POSTS = $(basename $(wildcard posts/*.md))
.PHONY: posts
posts: $(addsuffix .html,$(POSTS))
	cp -t html/$@ $(CSS)

index.html: index.md $(addsuffix .md,$(POSTS))
	mkdir -p html
	{ cat $<; for post in $(POSTS); do echo "- [$$(grep -m1 -Po '^title: \K.*' $$post.md)]($$post.html)"; done; } | \
		pandoc -s -t html $(addprefix -c ,$(CSS)) -o html/index.html

%.html: %.md
	mkdir -p html/$(@D)
	pandoc -s -t html $(addprefix -c ,$(CSS)) -o html/$@ $<
