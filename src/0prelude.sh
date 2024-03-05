#!/bin/bash
# Utility functions for bash scripts
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Define colors
readonly RED="\033[0;31m"
readonly GREEN="\033[0;32m"
readonly YELLOW="\033[0;33m"
readonly BLUE="\033[0;34m"
readonly NO_COLOR="\033[0m"

# Generic log function
log() {
    local level="$1"; shift
    local message="$1"; shift
    local color="$NO_COLOR"

    # Determine color based on log level
    case "$level" in
        INFO) color="$GREEN" ;;
        DEBUG) color="$BLUE" ;;
        WARN) color="$YELLOW" ;;
        ERROR) color="$RED" ;;
    esac

    # Print the message in the determined color
    echo -e "${color}[${level}]${NO_COLOR} $message" >&2
}

# Specific log level functions
info() {
    log "INFO" "$@"
}

debug() {
    log "DEBUG" "$@"
}

warn() {
    log "WARN" "$@"
}

error() {
    log "ERROR" "$@"
}
