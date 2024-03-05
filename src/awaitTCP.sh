#!/bin/bash

awaitTCP() {
    local port="${1:-80}"
    local host="${2:-127.0.0.1}"
    local delay="${3:-15}" # Delay between retries in seconds
    local retries="${4:-99}" # Number of retries, defaulting to 99

    for ((i=0; i<retries; i++)); do
        # Attempt to connect to the port
        if (echo > /dev/tcp/${host}/${port}) 2>/dev/null; then
            info "Success: Able to connect to ${host}:${port} on attempt $(($i + 1))"
            echo "Success: Able to connect to ${host}:${port}"
            return 0
        else
            info "Attempt $(($i + 1)) of ${retries} failed: Unable to connect to ${host}:${port}. Retrying in ${delay} seconds..."
            sleep $delay
        fi
    done

    error "Error: After ${retries} attempts, unable to connect to ${host}:${port}"
    echo "Error: After ${retries} attempts, unable to connect to ${host}:${port}"
    return 1
}
