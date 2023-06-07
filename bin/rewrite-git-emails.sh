#!/bin/bash

# TODO use this to change incorrect emails on gitea
# Loop over all the commits and use the --commit-filter
# to change only the email addresses

git filter-branch --commit-filter '

    # check to see if the committer (email is the desired one)
    if [ "$GIT_COMMITTER_EMAIL" = "<Old Email>" ];
    then
            # Set the new desired name
            GIT_COMMITTER_NAME="<New Name>";
            GIT_AUTHOR_NAME="<New Name>";

            # Set the new desired email
            GIT_COMMITTER_EMAIL="<New Email>";
            GIT_AUTHOR_EMAIL="<New Email>";

            # (re) commit with the updated information
            git commit-tree "$@";
    else
            # No need to update so commit as is
            git commit-tree "$@";
    fi' 
HEAD
