#!/bin/bash

echo "Starting tests..."

# save in a variable the current date
now=$(date +"%d-%m-%Y")

mkdir -p ./tests/results

./inso run test "${TEST_SUITE}" --src ./test.yaml --env "${ENV_PROFILE}" > "./tests/results/$now.txt"

echo "Sending email..."

recipient="${RECIPIENT}"
subject="UAT Report: $now"
attachment="./tests/results/$now.txt"
# read body.html from file and save it in a variable and use it as a body for the email
body=$(cat ./body.html)

# send email
echo "$body" | mutt -s "$subject" $recipient -a "$attachment" -e "set content_type=text/html"

rm -rf ./tests/results

echo "Done!"