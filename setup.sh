#!/usr/bin/env dash

__stow() {
    stow -R --target "${HOME}" "linux"
}

__stow
