# --------------------------------------------------
# Build tooling
# --------------------------------------------------

# Ensure cat, date, and git are available
ifeq (, $(shell which cat 2> /dev/null))
$(error "'cat' is not installed or available in PATH")
endif
ifeq (, $(shell which date 2> /dev/null))
$(error "'date' is not installed or available in PATH")
endif
ifeq (, $(shell which git 2> /dev/null))
$(error "'git' is not installed or available in PATH")
endif

APP_VERSION ?= $(shell cat $(APP_DIR)/version)
APP_COMMIT ?= $(shell git rev-parse --short HEAD 2> /dev/null)
APP_OS_ARCH ?= $(shell go version | awk '{print $$4;}')
APP_GO_VERSION ?= $(shell go version | awk '{print $$3;}')
APP_DATE_FORMAT := +'%Y-%m-%dT%H:%M:%SZ'
APP_BUILD_DATE ?= $(shell date $(APP_DATE_FORMAT))
APP_PACKAGE := main
define APP_LDFLAGS
-X $(APP_PACKAGE).Version=$(APP_VERSION) \
-X $(APP_PACKAGE).Commit=$(if $(APP_COMMIT),$(APP_COMMIT),dev) \
-X $(APP_PACKAGE).OsArch=$(APP_OS_ARCH) \
-X $(APP_PACKAGE).GoVersion=$(APP_GO_VERSION) \
-X $(APP_PACKAGE).BuildDate=$(APP_BUILD_DATE)
endef

.PHONY: build
build:
	@CGO_ENABLED=0 go build -ldflags "$(APP_LDFLAGS)" \
		-o "$(APP_DIR)/bin/$(APP_NAME)" "$(APP_DIR)"
