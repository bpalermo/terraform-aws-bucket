.PHONY: init
init:
	@terraform init

.PHONY: upgrade
upgrade:
	@terraform init -upgrade

.PHONY: format
format:
	@terraform fmt -recursive
