SHELL := "/bin/bash"

PACKAGE_NAME := "vkc-datahub-fixes"
VERSION := "1.0"
RELEASE := $(shell git rev-list --all | wc -l)
ARCHITECTURE := "noarch"
PREFIX := "/usr/local/VKC/Datahub/bin"
VENDOR := "Jonas De Moor"
RPM_USER := "blacklight"
RPM_GROUP := "blacklight"
DESCRIPTION := "Datahub Catmandu fixes"
MAINTAINER := "Jonas De Moor"
EPOCH := "1"

package:
	@echo "Building package:"
	@echo "  * Package name: $(PACKAGE_NAME)"
	@echo "  * Packge version: $(VERSION)"
	@echo "  * Package release: $(RELEASE)"

	fpm -s dir -t rpm \
		--name $(PACKAGE_NAME) \
		--version $(VERSION) \
		--iteration $(RELEASE) \
		--architecture $(ARCHITECTURE) \
		--prefix $(PREFIX) \
		--vendor $(VENDOR) \
		--rpm-user $(RPM_USER) \
		--rpm-group $(RPM_GROUP) \
		--description $(DESCRIPTION) \
		--maintainer $(MAINTAINER) \
		--epoch $(EPOCH) \
		--exclude .git \
		--exclude Makefile \
		--exclude buildenv.sh \
		--exclude envs \
		--exclude README.md \
		--exclude pipelines \
		--exclude scripts \
		.

	@echo "Contents of package:"
	rpm -qpl ./*.rpm

