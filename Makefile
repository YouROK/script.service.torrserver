NAME = script.service.torrserver
GIT = git
GIT_VERSION = $(shell $(GIT) describe --abbrev=0 --tags)
TAG_VERSION = $(subst v,,$(GIT_VERSION))
ZIP_SUFFIX = zip
ZIP_FILE = $(NAME)-$(TAG_VERSION).$(ZIP_SUFFIX)

all: clean zip

$(ZIP_FILE):
	$(GIT) archive --format zip --prefix $(NAME)/ --output $(ZIP_FILE) HEAD
	rm -rf $(NAME)

zip: $(ZIP_FILE)

clean_arch:
	 rm -f $(ZIP_FILE)

clean:
	rm -f $(ZIP_FILE)
	rm -rf $(NAME)
