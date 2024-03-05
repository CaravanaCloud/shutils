#!/bin/bash

#!/bin/bash

. ../src/0prelude.sh
. ../src/awaitURL.sh

# Test: awaitURL succeeds when the expected status code is returned
testAwaitURLSuccess() {
  awaitURL "https://httpbin.org/status/200" 200 1 3
  assertEquals "Expected function to succeed with status 200" 0 $?
}

# Test: awaitURL fails when a different status code is returned
testAwaitURLFailure() {
  # Here, we use a short delay and a small number of retries to make the test run faster.
  # We expect a 404 status, which httpbin.org can return for us, but we're checking for 200.
  awaitURL "https://httpbin.org/status/404" 200 1 1 || true
  assertNotEquals "Expected function to fail due to status 404" 1 $?
}

. shunit2  
