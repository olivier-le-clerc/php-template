.DEFAULT_GOAL := help

help:
	@printf "\033[33mUsage:\033[0m\n  make [command] [arg=\"val\"...]\n\n\033[33mTargets:\033[0m\n"
	@grep -E '^[-a-zA-Z0-9_\.\/]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[32m%-15s\033[0m %s\n", $$1, $$2}'

.PHONY: vendor
vendor: ## Install vendor 
	composer install

serve: ## serve on localhost:8000
	php -S localhost:8000
 
clean: ## Delete vendor and composer.lock
	$(RM) -r ./vendor
	$(RM) composer.lock

.PHONY: test
test: ## Run tests
	./vendor/bin/phpunit