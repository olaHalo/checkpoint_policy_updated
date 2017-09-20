#!/bin/bash

#all this script does is communicate with slack and run the expect script
currentDate=$(date)

curl -X POST --data-urlencode 'payload={"text": "Text", "username": "aliens", "icon_emoji": ":aliens:"}' https://hooks.slack.com/services/blahblahblahblah

/path/to/script
