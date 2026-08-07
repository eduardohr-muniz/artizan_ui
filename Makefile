EXAMPLE_DIR := example

# ── Package (root) ─────────────────────────────────────────────────────────────

.PHONY: get
get: ## Install dependencies (root package)
	flutter pub get

.PHONY: analyze
analyze: ## Static analysis (root package)
	flutter analyze

.PHONY: format
format: ## Format all Dart files (root package)
	dart format .

.PHONY: test
test: ## Run all tests
	flutter test

# ── Widgetbook ─────────────────────────────────────────────────────────────────

.PHONY: wb-get
wb-get: ## Install dependencies (Widgetbook example)
	cd $(EXAMPLE_DIR) && flutter pub get

.PHONY: wb-gen
wb-gen: ## Regenerate main.directories.g.dart after adding/removing @UseCase annotations
	cd $(EXAMPLE_DIR) && flutter pub run build_runner build --delete-conflicting-outputs

.PHONY: wb-watch
wb-watch: ## Watch and auto-regenerate on annotation changes
	cd $(EXAMPLE_DIR) && flutter pub run build_runner watch --delete-conflicting-outputs

.PHONY: wb-run
wb-run: ## Launch Widgetbook on the connected device/simulator
	cd $(EXAMPLE_DIR) && flutter run

.PHONY: wb-run-chrome
wb-run-chrome: ## Launch Widgetbook on Chrome
	cd $(EXAMPLE_DIR) && flutter run -d chrome

.PHONY: wb-analyze
wb-analyze: ## Static analysis (Widgetbook example)
	cd $(EXAMPLE_DIR) && flutter analyze

# ── Shortcuts ──────────────────────────────────────────────────────────────────

.PHONY: setup
setup: get wb-get ## Install dependencies for both root and example

.PHONY: gen
gen: wb-gen ## Alias for wb-gen

.PHONY: dev
dev: ## Regenerate + launch Widgetbook (most common workflow)
	cd $(EXAMPLE_DIR) && flutter pub run build_runner build --delete-conflicting-outputs && flutter run

.PHONY: dev-chrome
dev-chrome: ## Regenerate + launch Widgetbook on Chrome
	cd $(EXAMPLE_DIR) && flutter pub run build_runner build --delete-conflicting-outputs && flutter run -d chrome

# ── Help ───────────────────────────────────────────────────────────────────────

.PHONY: help
help: ## Show this help
	@grep -E '^[a-zA-Z_-]+:.*##' $(MAKEFILE_LIST) \
		| awk 'BEGIN {FS = ":.*##"}; {printf "  \033[36m%-18s\033[0m %s\n", $$1, $$2}'

.DEFAULT_GOAL := help
