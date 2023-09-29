#!/bin/bash

echo "Starting tests..."

# save in a variable the current date
now=$(date +"%d-%m-%Y")

mkdir -p ./tests/results

./inso run test "Orchestrator" --src ./test.yaml --env "DOCKER" > "./tests/results/$now.txt"

echo "Sending email..."

recipient="simon.dema@outlook.com"
subject="Monit UAT Report: $now"
attachment="./tests/results/$now.txt"
# read body.html from file and save it in a variable and use it as a body for the email
body=$(cat ./body.html)

# send email
echo "$body" | mutt -s "$subject" $recipient -a "$attachment" -e "set content_type=text/html"

echo "Done!"