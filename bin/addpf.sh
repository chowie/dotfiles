#!/bin/bash

function _addpf() {
    FILE="$2"
    pbpaste >> "$PROJECT_FILE_DIR/$FILE"
    file "$PROJECT_FILE_DIR/$FILE";
}


complete -F _addpf addpf

# added to ~/.bash_completions.d and sourced from .bash_profile
#source "${HOME}"/bin.dropbox/addpf_completions.bash

