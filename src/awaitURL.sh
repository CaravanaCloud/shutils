#!/bin/bash

awaitURL() {
    local url="$1"
    local expected_status="${2:-200}"
    local delay="${3:-15}" # Delay between retries in seconds
    local retries="${4:-99}" # Number of retries, defaulting to 99

    echo "Checking URL: $url for status: $expected_status"

    for ((i=0; i<retries; i++)); do
        # Use curl to get the HTTP status code of the response
        response=$(curl -o /dev/null -s -w "%{http_code}" "$url")

        if [ "$response" -eq "$expected_status" ]; then
            echo "Success: Received expected status $expected_status from $url"
            return 0
        else
            echo "Attempt $(($i + 1)) of $retries failed: Received status $response from $url. Retrying in ${delay} seconds..."
            sleep $delay
        fi
    done

    echo "Error: After $retries attempts, did not receive expected status $expected_status from $url"
    return 1
}