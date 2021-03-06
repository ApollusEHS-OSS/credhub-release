#!/usr/bin/env bash

function set_bash_error_handling() {
    set -euo pipefail
}

function go_to_project_root_directory() {
    local -r script_dir=$( dirname "${BASH_SOURCE[0]}")

    cd "$script_dir/.."
}

function install_gems() {
    pushd spec >/dev/null
        bundle
    popd >/dev/null
}

function run_tests() {
    pushd spec >/dev/null
        bundle exec rspec .
    popd >/dev/null
}

function main() {
    set_bash_error_handling
    go_to_project_root_directory

    install_gems
    run_tests
}

main
