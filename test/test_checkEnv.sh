#!/bin/bash

. ../src/0prelude.sh
. ../src/checkEnv.sh

testCheckEnvAllPresent() {
  export VAR1="value1"
  export VAR2="value2"
  output=$(checkEnv VAR1 VAR2)
  assertEquals "Success: All variables are defined and not empty." "$output"
}

testCheckEnvSomeMissing() {
  export VAR1="value1"
  unset VAR2  # Ensure VAR2 is not set for this test
  output=$(checkEnv VAR1 VAR2 || true)
  echo "$output" | grep -q "VAR2"
  assertTrue "Expected '$output' to contain 'VAR2'" $?
}


. shunit2
