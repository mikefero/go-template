# --------------------------------------------------
# Common tooling
# --------------------------------------------------

# Ensure golang is available
ifeq (, $(shell which go 2> /dev/null))
$(error "'go' is not installed or available in PATH")
endif

.PHONY: go-mod-upgrade
go-mod-upgrade: ## Upgrade go modules
	@go get -u ./...
	@go mod tidy
	@go mod verify > /dev/null
