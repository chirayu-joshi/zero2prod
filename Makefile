install:
	cargo install cargo-watch
	cargo install cargo-tarpaulin
	cargo install cargo-audit
	cargo install cargo-edit
	cargo install sqlx-cli --no-default-features --features postgres

install_psql_locally_mac:
	brew doctor
	brew update
	brew install libpq
	brew link --force libpq

start_db:
	chmod +x scripts/init_db.sh
	./scripts/init_db.sh

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

format_code:
	cargo fmt

test:
	cargo test

run:
	cargo run

watch:
	cargo watch -x check -x test -x run
