#!/bin/bash

. ../src/0prelude.sh
. ../src/awaitTCP.sh

testCheckPortOpen() {
  awaitTCP 24000 127.0.0.1 2 1
  assertEquals "Expected the port to be open" 0 $?
}

testCheckPortClosed() {
  awaitTCP 24001 127.0.0.1 2 1
  assertEquals "Expected the port to be closed" 1 $?
}

. shunit2

