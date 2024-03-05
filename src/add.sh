
add() {
    local result=$(($1 + $2))
    # Logs are sent to stderr
    info "$result"
    # Data is sent to stdout
    echo "$result"
    # Error code is returned
    return 0
}
