#!/bin/bash
alias git-tree="git log --graph --date=relative  --decorate --pretty=\"format:%C(yellow)%h %C(blue)%>(12)%ad %C(green)%<(7)%aN%C(auto)%d %C(reset)%s\""

# rebase to origin/master
function grebase
{
    git fetch --all
    git stash save prebase
    git rebase ${@-origin/master}
    git stash pop
}
