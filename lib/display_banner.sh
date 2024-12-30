#!/bin/sh

display_banner() {
  if is_mac; then
    echo "=============================================================================="
    echo "                                                                         "
    echo "        .:'     "
    echo "    __ :'__     "
    echo " .'`  `-'  ``.  "
    echo ":          .-'  "
    echo ":         :     "
    echo " :         `-;  "
    echo "  `.__.-.__.'   "
    echo "                                                                         "
    echo "=============================================================================="
  elif is_fedora; then
    echo "=============================================================================="
    echo "                                                                         "
    echo "         ${TEXT_CYAN},'''''.${RESET}                                                         "
    echo "        ${TEXT_CYAN}|   ,.  |${RESET}                      ${BOLD}Fedora supported${RESET}                  "
    echo "        ${TEXT_CYAN}|  |  '_'${RESET}    ${TEXT_GRAY}Easy setup for system packages, tools, and configs${RESET}  "
    echo "   ${TEXT_CYAN},....|  |..${RESET}     -----------------------------------------------------------"
    echo " ${TEXT_CYAN}.'  ,_;|   ..'${RESET}                                                          "
    echo " ${TEXT_CYAN}|  |   |  |${RESET}         ${BOLD}Author${RESET}: Chunhui Ren                                 "
    echo " ${TEXT_CYAN}|  ',_,'  |${RESET}         ${BOLD}GitHub${RESET}: https://github.com/renchunhui/dotfiles      "
    echo "  ${TEXT_CYAN}'.     ,'${RESET}                                                              "
    echo "    ${TEXT_CYAN}'''''${RESET}                                                                "
    echo "                                                                         "
    echo "=============================================================================="
  else
    echo "Unknown Linux distribution."
  fi
}









