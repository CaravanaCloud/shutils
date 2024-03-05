#!/bin/bash
. ../src/0prelude.sh
. ../src/add.sh

testAdd() {
  result=$(add 2 3)
  assertEquals "The addition of 2 and 3 should equal 5" 5 "$result"
}

testAddNegativeNumbers() {
  result=$(add -1 -2)
  assertEquals "The addition of -1 and -2 should equal -3" -3 "$result"
}

. shunit2

