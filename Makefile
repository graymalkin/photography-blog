IMAGES = $(wildcard images/*.jpeg)
GEN = $(patsubst images/%.jpeg,static/images/%-small.jpeg,$(IMAGES)) \
	$(patsubst images/%.jpeg,static/images/%-medium.jpeg,$(IMAGES)) \
	$(patsubst images/%.jpeg,static/images/%-large.jpeg,$(IMAGES)) \
	$(patsubst images/%.jpeg,static/thumbs/%.jpeg,$(IMAGES))

THUMB = 420x420
SMALL = 768x768
MEDIUM = 1000x1000
LARGE = 2500x2500

all: $(GEN)
	hugo

static/images/%-small.jpeg : images/%.jpeg
	@mkdir -p $(dir $@)
	convert $< -resize $(SMALL) $@

static/images/%-medium.jpeg : images/%.jpeg
	@mkdir -p $(dir $@)
	convert $< -resize $(MEDIUM) $@

static/images/%-large.jpeg : images/%.jpeg
	@mkdir -p $(dir $@)
	convert $< -resize $(LARGE) $@

static/thumbs/%.jpeg : images/%.jpeg
	@mkdir -p $(dir $@)
	convert $< -resize $(THUMB) $@

clean:
	rm $(GEN)
	rm -r public/
