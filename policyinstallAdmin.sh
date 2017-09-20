#!/usr/bin/expect -f

#Do not timeout
set timeout -1

#Enable this for debugging
#exp_internal 1

# Set variables
set hostname "IP or hostname"
set username "username"
set password "password"
set date [exec date +%F_%R]

# Policy Success Variables
set caulusGood 5
set internetvpnGood 5
set internetinternalGood 5
set internetexternalGood 5
set pftaGood 5
set myersGood 5
set publicsafetyGood 5
set eocGood 5
set telephonyGood 5

# Log results
log_file -a /path/to/logfile


# Don't check keys
#spawn ssh -oKexAlgorithms=+diffie-hellman-group1-sha1 -o StrictHostKeyChecking=no $username\@$hostname
spawn ssh -o StrictHostKeyChecking=no $username\@$hostname


# Connection issues & priv password
expect {
timeout { send_user "\nTimeout Exceeded - Check Host\n"; exit 1 }
eof { send_user "\nSSH Connection To $hostname Failed\n"; exit 1 }
"*assword:" { send "$password\r" }
}


sleep 5
# Database Revision Commands

expect {
    "*#" { 
            set timeout -1
            send "dbver\r"
            expect "*localhost'):"
            send "localhost\r"
            expect "*dbver>"
            send "create Pre_[exec date +%F_%R] Wedlow_Policy_Script\r"
            expect "*dbver>"
            send "exit\r"
            expect "*~]#"
            }
          }



#Airport Install

send "fwm load Airport Caelus\r"

expect {
      "*successfully on Caelus"     {
            send_user ">>>>> Caelus Successfully Installed <<<<<"
            set caulusGood 1
            expect "*~]#"


                                    }

      "*olicy verification failed" {
            send_user ">>>>> Caelus Failed <<<<<<"
            set caulusGood 2
            expect "*~]#"


                                     }
      }

#Internet VPN 4800

send "fwm load Internet_VPN_4800 External_VPN_4800_Cluster\r"

expect {
      "*for all modules was successful"     {
            send_user ">>>>> Internet VPN Successfully Installed <<<<<"
            set internetvpnGood 1
            expect "*~]#"


                                    }

      "*olicy verification failed" {
            send_user ">>>>> Internet VPN Failed <<<<<<"
            set internetvpnGood 2
            expect "*~]#"


                                     }
      }

#Internet Internal

send "fwm load Internet_Internal_13500_import Internal_13500_Cluster\r"

expect {
      "*for all modules was successful"     {
            send_user ">>>>> Internet Internal Successfully Installed <<<<<"
            set internetinternalGood 1
            expect "*~]#"


                                    }

      "*olicy verification failed" {
            send_user ">>>>> Internet Internal Failed <<<<<<"
            set internetinternalGood 2
            expect "*~]#"


                                     }
      }

#Internet External

send "fwm load Internet_External_13500_import External_13500_Cluster\r"

expect {
      "*for all modules was successful"     {
            send_user ">>>>> Internet External Successfully Installed <<<<<"
            set internetexternalGood 1
            expect "*~]#"


                                    }

      "*olicy verification failed" {
            send_user ">>>>> Internet External Failed <<<<<<"
            set internetexternalGood 2
            expect "*~]#"


                                     }
      }

#PFTA Server

send "fwm load PFTA_Server_Policy PFTA_5800_Cluster\r"

expect {
      "*for all modules was successful"     {
            send_user ">>>>> PFTA Server Successfully Installed <<<<<"
            set pftaGood 1
            expect "*~]#"


                                    }

      "*olicy verification failed" {
            send_user ">>>>> PFTA Server Failed <<<<<<"
            set pftaGood 2
            expect "*~]#"


                                     }
      }

#Myers

send "fwm load Myers_Cluster Myrs_12000_Cluster\r"

expect {
      "*for all modules was successful"     {
            send_user ">>>>> Myers Successfully Installed <<<<<"
            set myersGood 1
            expect "*~]#"


                                    }

      "*olicy verification failed" {
            send_user ">>>>> Myers Server Failed <<<<<<"
            set myersGood 2
            expect "*~]#"


                                     }
      }

#Public Safety

send "fwm load Public_Safety_5600 Public_Safety_5600_Cluster\r"

expect {
      "*for all modules was successful"     {
            send_user ">>>>> Public Safety Successfully Installed <<<<<"
            set publicsafetyGood 1
            expect "*~]#"


                                    }

      "*olicy verification failed" {
            send_user ">>>>> Public Safety Server Failed <<<<<<"
            set publicsafetyGood 2
            expect "*~]#"


                                     }
      }


#EOC

send "fwm load EOC_PFTA_Policy EOC_PFTA\r"

expect {
      "*for all modules was successful"     {
            send_user ">>>>> EOC Successfully Installed <<<<<"
            set eocGood 1
            expect "*~]#"


                                    }

      "*olicy verification failed" {
            send_user ">>>>> EOC Server Failed <<<<<<"
            set eocGood 2
            expect "*~]#"


                                     }
      }

#Telephony

send "fwm load Telephony Myrs_telephony\r"

expect {
      "*for all modules was successful"     {
            send_user ">>>>> Telephony Successfully Installed <<<<<"
            set telephonyGood 1
            expect "*~]#"


                                    }

      "*olicy verification failed" {
            send_user ">>>>> Telephony Server Failed <<<<<<"
            set telephonyGood 2
            expect "*~]#"


                                     }
      }




#Exit Butters

send "exit\r"

#Add delay
sleep 5

#Arguments List

#Pass arguments to Bash script with checks
spawn ./policyinstallPost.sh $caulusGood $internetvpnGood $internetinternalGood $internetexternalGood $pftaGood $myersGood $publicsafetyGood $eocGood $telephonyGood

expect eoc
