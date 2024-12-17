# --------------------------------------------------
# Common tooling
# --------------------------------------------------

.PHONY: go-mod-upgrade
go-mod-upgrade:
	@go get -u ./...
	@go mod tidy
	@go mod verify > /dev/null
