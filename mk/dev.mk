# --------------------------------------------------
# Development tooling
# --------------------------------------------------

define APP_LDFLAGS
-X $(APP_PACKAGE).AppName=$(APP_NAME) \
-X $(APP_PACKAGE).Version=dev \
-X $(APP_PACKAGE).Commit=dev \
-X $(APP_PACKAGE).OsArch=dev \
-X $(APP_PACKAGE).GoVersion=dev \
-X $(APP_PACKAGE).BuildDate=dev
endef

.PHONY: version
version: ## Run the version command
	@CGO_ENABLED=0 go run -ldflags "$(APP_LDFLAGS)" "$(APP_DIR)" version

.PHONY: license
license: ## Run the license command
	@CGO_ENABLED=0 go run -ldflags "$(APP_LDFLAGS)" "$(APP_DIR)" license
