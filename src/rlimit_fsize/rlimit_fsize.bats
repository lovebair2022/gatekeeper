#!/usr/bin/env bats

setup() {
    export PATH="$BATS_TEST_DIRNAME:$PATH"
}

@test "${BATS_TEST_DIRNAME##*/} ok" {
    run rlimit_fsize 30 dd if=/dev/zero of="${BATS_TMPDIR}file" bs=1 count=4
    [ "$status" = 0 ]
}

@test "${BATS_TEST_DIRNAME##*/} max" {
    run rlimit_fsize 3 dd if=/dev/zero of="${BATS_TMPDIR}file" bs=1 count=4
    [ "$status" = 153 ]
}
