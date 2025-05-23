#!/bin/sh

platform() {
    case "$(uname -s)" in
        Linux)
            echo ${CYAN}Linux${RESET}
            ;;
        Darwin)
            echo ${CYAN}macOS${RESET}
            ;;
        *)
            echo "Unknown platform: $(uname -s)"
            exit 1
            ;;
    esac
}
