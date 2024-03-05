checkEnv() {
    local missingVars=()

    for varName in "$@"; do
        if [[ -z ${!varName+x} ]]; then
            missingVars+=("$varName")
        fi
    done

    if [ ${#missingVars[@]} -ne 0 ]; then
        echo "Error: The following environment variables are missing or empty: ${missingVars[*]}"
        return 1
    else
        echo "Success: All variables are defined and not empty."
        return 0
    fi
}
