#!/bin/bash

#############
#Author:             Naveen Kumar
#Version:            V1
#URL trying to hit   https://api.github.com/repos/OWNER/REPO/collaborators
#Task:               To list the users with read access under the repository
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
echo "REPO_OWNER='$REPO_OWNER' and REPO_NAME='$REPO_NAME'"

#Function to make GET Request to the GitHub API
function github_api_get {
	local endpoint="$1"

	#DEBUGGING
	echo "endpoint='$endpoint'"

        local url="${API_URL}/${endpoint}"
	
	#Send a GET Request to the GitHub API with authentication
	curl -s -u "${USERNAME}:${TOKEN}" "url"
}


#Function to list the users with read access to the repository
function list_users_with_read_access{
	local endpoint="repos/${REPO_OWNER}/${REPO_NAME}/collaborators"

	#Fetch the list of collaborators on the repository
	collaborators="$(github_api_get "$endpoint" | jq -r '.[] select().permissions.pull == true | .login')"

	#Display the list of collaborators with read access
	if [[ -z "$collaborators"  ]] then
		echo "No users with the read access found for ${REPO_OWNER}/${REPO_NAME}."

	else
		echo "Users with the read access to ${REPO_OWNER}/${REPO_NAME}:"
		echo "$collaborators"
	fi
}

#Main Script
echo "Listing the users with Read Access to the ${REPO_OWNER}/${REPO_NAME}..."
list_users_with_read_access 



