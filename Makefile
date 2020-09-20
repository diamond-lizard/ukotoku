.PHONY: all
.PHONY: test
.PHONY: test_audio2img
.PHONY: test_img2audio

TEST_DIR := test

AUDIO2IMG_INPUT  := $(TEST_DIR)/input.wav
AUDIO2IMG_OUTPUT := $(TEST_DIR)/output.tiff

IMG2AUDIO_INPUT  := $(TEST_DIR)/input.tiff
IMG2AUDIO_OUTPUT := $(TEST_DIR)/output.wav

APP := ./ukotoku

all: test

clean:
	rm -f test/output.tiff test/output.wav

test: test_audio2img test_img2audio

test_audio2img:
	$(APP) --resolution 163x163 $(AUDIO2IMG_INPUT) $(AUDIO2IMG_OUTPUT)

test_img2audio:
	$(APP) --channels 1 --sampwidth 2 --samprate 22050 $(IMG2AUDIO_INPUT) $(IMG2AUDIO_OUTPUT)
