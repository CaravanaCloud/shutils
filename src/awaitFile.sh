awaitFile() {
    local filepath="$1"
    local delay="${2:-5}" # Delay between retries in seconds, default to 5 seconds
    local retries="${3:-12}" # Number of retries, defaulting to 12 (1 minute if delay is 5 seconds)

    echo "Waiting for file $filepath to exist..."

    for ((i=0; i<retries; i++)); do
        if [ -e "$filepath" ]; then
            echo "File $filepath exists."
            return 0
        else
            echo "File $filepath not found. Retrying in ${delay} seconds..."
            sleep $delay
        fi
    done

    echo "Error: File $filepath does not exist after $(($retries * $delay)) seconds."
    return 1
}
