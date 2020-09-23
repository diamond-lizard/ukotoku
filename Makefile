.PHONY: all
.PHONY: test
.PHONY: test_audio2img
.PHONY: test_img2audio

TEST_DIR := test

AUDIO2IMG_INPUT  := $(TEST_DIR)/input.wav
AUDIO2IMG_OUTPUT := $(TEST_DIR)/output.tiff

APP := ./ukotoku

all: test

clean:
	rm -f test/output.png test/output.tiff test/output.wav

test: test_audio2img test_img2audio

test_audio2img:
	$(APP) --resolution 163x163 --channels 3 $(AUDIO2IMG_INPUT) $(TEST_DIR)/output.png
#	$(APP) --resolution 163x163 --channels 1 $(AUDIO2IMG_INPUT) $(TEST_DIR)/output.tiff

test_img2audio:
	$(APP) --channels 1 --sampwidth 2 --samprate 22050 $(TEST_DIR)/input.tiff $(IMG2AUDIO_OUTPUT)
