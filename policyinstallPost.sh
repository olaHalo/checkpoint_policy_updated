#!/bin/bash

#This script checks the arguments passed from policyInstallAdmin and emails/messages slack if it passed or failed

if [ $1 -eq 1 ]
then
	curl -X POST --data-urlencode 'payload={"text": "Caulus installed *CORRECTLY*", "username": "aliens", "icon_emoji": ":aliens:"}' WEBHOOK


else 
    curl -X POST --data-urlencode 'payload={"text": "Caulus installed *FAILED*, check logs", "username": "aliens", "icon_emoji": ":aliens:"}' WEBHOOK
    mail -s "Check Point Policy Installer Failure on Airport" EMAIL <<< "Policy Install failed on Airport, check logs"


fi






if [ $2 -eq 1 ]
then
        curl -X POST --data-urlencode 'payload={"text": "InternetVPN installed *CORRECTLY*", "username": "aliens", "icon_emoji": ":aliens:"}' WEBHOOK

else
    curl -X POST --data-urlencode 'payload={"text": "Internet VPN install *FAILED*, check logs", "username": "aliens", "icon_emoji": ":aliens:"}' WEBHOOK
    mail -s "Check Point Policy Installer Failure on InternetVPN" EMAIL <<< "Policy Install failed on InternetVPN, check logs"

fi





if [ $3 -eq 1 ]
then
        curl -X POST --data-urlencode 'payload={"text": "Internet Internal installed *CORRECTLY*", "username": "aliens", "icon_emoji": ":aliens:"}' WEBHOOK


else
    curl -X POST --data-urlencode 'payload={"text": "Internet Internal install *FAILED*, check logs", "username": "aliens", "icon_emoji": ":aliens:"}' WEBHOOK
    mail -s "Check Point Policy Installer Failure on Internet Internal" EMAIL <<< "Policy Install failed on Internet Internal, check logs"

fi




if [ $4 -eq 1 ]
then
        curl -X POST --data-urlencode 'payload={"text": "Internet External installed *CORRECTLY*", "username": "aliens", "icon_emoji": ":aliens:"}' WEBHOOK


else
    curl -X POST --data-urlencode 'payload={"text": "Internet External install *FAILED*, check logs", "username": "aliens", "icon_emoji": ":aliens:"}' WEBHOOK
    mail -s "Check Point Policy Installer Failure on Internet External" EMAIL <<< "Policy Install failed on Internet External, check logs"


fi




if [ $5 -eq 1 ]
then
        curl -X POST --data-urlencode 'payload={"text": "PFTA installed *CORRECTLY*", "username": "aliens", "icon_emoji": ":aliens:"}' WEBHOOK


else
    curl -X POST --data-urlencode 'payload={"text": "PFTA install *FAILED*, check logs", "username": "aliens", "icon_emoji": ":aliens:"}' WEBHOOK
    mail -s "Check Point Policy Installer Failure on PFTA" EMAIL <<< "Policy Install failed on PFTA, check logs"


fi





if [ $6 -eq 1 ]
then
        curl -X POST --data-urlencode 'payload={"text": "Myers installed *CORRECTLY*", "username": "aliens", "icon_emoji": ":aliens:"}' WEBHOOK


else
    curl -X POST --data-urlencode 'payload={"text": "Myers install *FAILED*, check logs", "username": "aliens", "icon_emoji": ":aliens:"}' WEBHOOK
    mail -s "Check Point Policy Installer Failure on Myers" EMAIL <<< "Policy Install failed on Myers, check logs"

fi






if [ $7 -eq 1 ]
then
        curl -X POST --data-urlencode 'payload={"text": "Public Safety installed *CORRECTLY*", "username": "aliens", "icon_emoji": ":aliens:"}' WEBHOOK


else
    curl -X POST --data-urlencode 'payload={"text": "Public Safety install *FAILED*, check logs", "username": "aliens", "icon_emoji": ":aliens:"}' WEBHOOK
    mail -s "Check Point Policy Installer Failure on Public Safety" EMAIL <<< "Policy Install failed on Public Safety, check logs"

fi






if [ $8 -eq 1 ]
then
        curl -X POST --data-urlencode 'payload={"text": "EOC installed *CORRECTLY*", "username": "aliens", "icon_emoji": ":aliens:"}' WEBHOOK


else
    curl -X POST --data-urlencode 'payload={"text": "EOC install *FAILED*, check logs", "username": "aliens", "icon_emoji": ":aliens:"}' WEBHOOK
    mail -s "Check Point Policy Installer Failure on EOC" EMAIL <<< "Policy Install failed on EOC, check logs"

fi





if [ $9 -eq 1 ]
then
        curl -X POST --data-urlencode 'payload={"text": "Telephony installed *CORRECTLY*", "username": "aliens", "icon_emoji": ":aliens:"}' WEBHOOK


else
    curl -X POST --data-urlencode 'payload={"text": "Telephony install *FAILED*, check logs", "username": "aliens", "icon_emoji": ":aliens:"}' WEBHOOK
   mail -s "Check Point Policy Installer Failure on Telephony" EMAIL <<< "Policy Install failed on Telephony, check logs"

fi

if [ $10 -eq 1 ]
then
        curl -X POST --data-urlencode 'payload={"text": "Aviation installed *CORRECTLY*", "username": "aliens", "icon_emoji": ":aliens:"}' WEBHOOK


else
    curl -X POST --data-urlencode 'payload={"text": "Aviation install *FAILED*, check logs", "username": "aliens", "icon_emoji": ":aliens:"}' WEBHOOK
   mail -s "Check Point Policy Installer Failure on Telephony" EMAIL <<< "Policy Install failed on Telephony, check logs"

fi

if [ $11 -eq 1 ]
then
        curl -X POST --data-urlencode 'payload={"text": "Medic installed *CORRECTLY*", "username": "aliens", "icon_emoji": ":aliens:"}' WEBHOOK


else
    curl -X POST --data-urlencode 'payload={"text": "Medic install *FAILED*, check logs", "username": "aliens", "icon_emoji": ":aliens:"}' WEBHOOK
   mail -s "Check Point Policy Installer Failure on Telephony" EMAIL <<< "Policy Install failed on Telephony, check logs"

fi
