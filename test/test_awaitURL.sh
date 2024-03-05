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
  assertNotEquals "Expected function to fail due to status 404" 0 $?
}

# Test: awaitURL eventually succeeds with retries
testAwaitURLWithRetries() {
  # Simulating a scenario where the first request might fail, but subsequent retries succeed.
  # For the purpose of this example, we'll assume httpbin.org/status/200 always succeeds immediately.
  # In real scenarios, you might need a more sophisticated setup to test retries.
  awaitURL "https://httpbin.org/status/200" 200 1 3
  assertEquals "Expected function to succeed with status 200 after retries" 0 $?
}

# Load and run shUnit2
. /path/to/shunit2  # Adjust this path to where shUnit2 is located
