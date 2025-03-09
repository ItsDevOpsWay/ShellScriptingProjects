#!/bin/bash


#############
#Author:             Naveen Kumar
#Version:            V1
#URL trying to print https://api.github.com/repos/OWNER/REPO/collaborators
#Task:               To create the above URL using the function
#############


#GitHub API Base URL
API_URL="https://api.github.com"


#GitHub Username and Personal Access
USERNAME=$username
TOKEN=$token


#Owner and Repository information
REPO_OWNER=$1
REPO_NAME=$2

#DEBUGGING
echo "REPO_OWNER='$REPO_OWNER', REPO_NAME='$REPO_NAME'"

#Function to make GET Request to the GitHub API
function github_api_get {
	local endpoint="$1"
        #DEBUGGING
	echo "endpoint='$endpoint'"
	local url="${API_URL}/${endpoint}"
	echo "$url"x
}


github_api_get "repos/${REPO_OWNER}/${REPO_NAME}/collaborators"

