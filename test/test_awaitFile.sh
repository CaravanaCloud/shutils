#!/bin/bash

. ../src/0prelude.sh
. ../src/awaitFile.sh

# Test: File exists (/dev/zero always exists)
testFileExists() {
    awaitFile "/dev/zero" 1 1
    assertEquals "Expected the function to return success (0) because /dev/zero always exists" 0 $?
}

# Test: File does not exist
testFileDoesNotExist() {
    awaitFile "/dev/somethingelsethatneverexists" 1 1 || true
    local status=$?
    assertNotEquals "Expected the function to return error (1) because the file does not exist" 1 $status
}

. shunit2

