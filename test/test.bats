#!/usr/bin/env bats

setup_file() {
	docker compose up --detach --build --wait --wait-timeout 30
}

setup() {
	load 'test_helper/bats-support/load'
	load 'test_helper/bats-assert/load'
}

teardown_file() {
	docker compose down
}

# Basic tests
# ============================================================================
@test "Do some tests" {
	run echo "OK"
	assert_success
}
