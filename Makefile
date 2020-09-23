.PHONY: all
.PHONY: test
.PHONY: test_audio2img
.PHONY: test_img2audio

TEST_DIR := test

APP := ./ukotoku

all: test

clean:
	rm -f $(TEST_DIR)/output-163x163-1-channel-16-bit-signed.tiff
	rm -f $(TEST_DIR)/output-163x163-3-channels-16-bit-signed.tiff
	rm -f $(TEST_DIR)/output-1-channel-2-sampwidth-22050-samprate-from-tiff.wav

test: test_audio2img test_img2audio

test_audio2img:
	$(APP) --resolution 163x163 --channels 1 --bits 16 --signed $(TEST_DIR)/input.wav $(TEST_DIR)/output-163x163-1-channel-16-bit-signed.tiff
	$(APP) --resolution 163x163 --channels 3 --bits 16 --signed $(TEST_DIR)/input.wav $(TEST_DIR)/output-163x163-3-channels-16-bit-signed.tiff

test_img2audio:
	$(APP) --channels 1 --sampwidth 2 --samprate 22050 $(TEST_DIR)/input.tiff $(TEST_DIR)/output-1-channel-2-sampwidth-22050-samprate-from-tiff.wav
