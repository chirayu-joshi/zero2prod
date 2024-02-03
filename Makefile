install:
	cargo install cargo-watch
	cargo install cargo-tarpaulin
	cargo install cargo-audit
	cargo install cargo-edit

	cargo add actix-web
	cargo add tokio --features "macros rt-multi-thread"

build:
	cargo build

check_coverage:
	cargo tarpaulin --ignore-tests

check_linting:
	cargo clippy -- -D warnings

check_formatting:
	cargo fmt -- --check

audit_project:
	cargo audit

run_continous_integration: check_coverage check_linting check_formatting audit_project

run:
	cargo run

watch:
	cargo watch -x check -x test -x run
