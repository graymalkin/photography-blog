IMAGES = $(wildcard images/*.jpeg)
GEN = $(patsubst images/%.jpeg,static/images/%-small.jpeg,$(IMAGES)) \
	$(patsubst images/%.jpeg,static/images/%-medium.jpeg,$(IMAGES)) \
	$(patsubst images/%.jpeg,static/images/%-large.jpeg,$(IMAGES)) \
	$(patsubst images/%.jpeg,static/thumbs/%.jpeg,$(IMAGES))

all: $(GEN)
	hugo

static/images/%-small.jpeg : images/%.jpeg
	@mkdir -p $(dir $@)
	convert $< -resize 500x500 $@

static/images/%-medium.jpeg : images/%.jpeg
	@mkdir -p $(dir $@)
	convert $< -resize 1000x1000 $@

static/images/%-large.jpeg : images/%.jpeg
	@mkdir -p $(dir $@)
	convert $< -resize 2500x2500 $@

static/thumbs/%.jpeg : images/%.jpeg
	@mkdir -p $(dir $@)
	convert $< -resize 320x320 $@
