#!/usr/bin/expect -f
send "COMMAND\r"
#expect "*config)#"

set timeout -1

#Enable this for debugging
#exp_internal 1

# Set variables
set hostname "Address"
set username "user"
set password "password"
set date [exec date +%F_%R]

set hostnameNagios "address"
set usernameNagios "user"
set passwordNagios "password"

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
set aviationGood 5
set medicGood 5

# Log results
log_file -a pathtologfile


# Don't check keys and SSH to Butters
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
            expect "*:0]#"
            }
          }



#Airport Install

send "fwm load Airport Caelus\r"

expect {
      "*successfully on Caelus"     {
            send_user ">>>>> Caelus Successfully Installed <<<<<"
            set caulusGood 1
            expect "*:0]#"


                                    }

      "*olicy verification failed" {
            send_user ">>>>> Caelus Failed <<<<<<"
            set caulusGood 2
            expect "*:0]#"


                                     }
      }

#Internet VPN 4800

send "fwm load Internet_VPN_4800 External_VPN_4800_Cluster\r"

expect {
      "*for all modules was successful"     {
            send_user ">>>>> Internet VPN Successfully Installed <<<<<"
            set internetvpnGood 1
            expect "*:0]#"


                                    }

      "*olicy verification failed" {
            send_user ">>>>> Internet VPN Failed <<<<<<"
            set internetvpnGood 2
            expect "*:0]#"


                                     }
      }

#Internet Internal

send "fwm load Internet_Internal_13500_import Internal_13500_Cluster\r"

expect {
      "*for all modules was successful"     {
            send_user ">>>>> Internet Internal Successfully Installed <<<<<"
            set internetinternalGood 1
            expect "*:0]#"


                                    }

      "*olicy verification failed" {
            send_user ">>>>> Internet Internal Failed <<<<<<"
            set internetinternalGood 2
            expect "*:0]#"


                                     }
      }

#Internet External

send "fwm load Internet_External_13500_import External_13500_Cluster\r"

expect {
      "*for all modules was successful"     {
            send_user ">>>>> Internet External Successfully Installed <<<<<"
            set internetexternalGood 1
            expect "*:0]#"


                                    }

      "*olicy verification failed" {
            send_user ">>>>> Internet External Failed <<<<<<"
            set internetexternalGood 2
            expect "*:0]#"


                                     }
      }

#PFTA Server

send "fwm load PFTA_Server_Policy PFTA_5800_Cluster\r"

expect {
      "*for all modules was successful"     {
            send_user ">>>>> PFTA Server Successfully Installed <<<<<"
            set pftaGood 1
            expect "*:0]#"


                                    }

      "*olicy verification failed" {
            send_user ">>>>> PFTA Server Failed <<<<<<"
            set pftaGood 2
            expect "*:0]#"


                                     }
      }

#Myers

send "fwm load Myers_Cluster Myrs_12000_Cluster\r"

expect {
      "*for all modules was successful"     {
            send_user ">>>>> Myers Successfully Installed <<<<<"
            set myersGood 1
            expect "*:0]#"


                                    }

      "*olicy verification failed" {
            send_user ">>>>> Myers Server Failed <<<<<<"
            set myersGood 2
            expect "*:0]#"


                                     }
      }

#Public Safety

send "fwm load Public_Safety_5600 Public_Safety_5600_Cluster\r"

expect {
      "*for all modules was successful"     {
            send_user ">>>>> Public Safety Successfully Installed <<<<<"
            set publicsafetyGood 1
            expect "*:0]#"


                                    }

      "*olicy verification failed" {
            send_user ">>>>> Public Safety Server Failed <<<<<<"
            set publicsafetyGood 2
            expect "*:0]#"


                                     }
      }


#EOC

send "fwm load EOC_PFTA_Policy EOC_PFTA\r"

expect {
      "*for all modules was successful"     {
            send_user ">>>>> EOC Successfully Installed <<<<<"
            set eocGood 1
            expect "*:0]#"


                                    }

      "*olicy verification failed" {
            send_user ">>>>> EOC Server Failed <<<<<<"
            set eocGood 2
            expect "*:0]#"


                                     }
      }

#Telephony

send "fwm load Telephony Myrs_telephony\r"

expect {
      "*for all modules was successful"     {
            send_user ">>>>> Telephony Successfully Installed <<<<<"
            set telephonyGood 1
            expect "*:0]#"


                                    }

      "*olicy verification failed" {
            send_user ">>>>> Telephony Server Failed <<<<<<"
            set telephonyGood 2
            expect "*:0]#"
            sleep 10

                                     }
      }

#Aviation_Policy

send "fwm load Aviation_Policy Aviation_4200_Cluster\r"

expect {
      "*for all modules was successful"     {
            send_user ">>>>> Aviation_Policy Successfully Installed <<<<<"
            set aviationGood 1
            expect "*:0]#"


                                    }

      "*olicy verification failed" {
            send_user ">>>>> Aviation_Policy Server Failed <<<<<<"
            set aviationGood 2
            expect "*:0]#"
            sleep 10

                                     }
      }

#Medic_Policy

send "fwm load Medic_911 Libitina\r"

expect {
      "*for all modules was successful"     {
            send_user ">>>>> Medic_911 Successfully Installed <<<<<"
            set medicGood 1
            expect "*:0]#"


                                    }

      "*olicy verification failed" {
            send_user ">>>>> Medic_911 Server Failed <<<<<<"
            set medicGood 2
            expect "*:0]#"
            sleep 10

                                     }
      }





sleep 15

#Exit Butters

send "exit\r"




#expect eof
sleep 15

#SSH to Nagios 
spawn ssh -o StrictHostKeyChecking=no $usernameNagios\@$hostnameNagios
expect {
timeout { send_user "\nTimeout Exceeded - Check Host\n"; exit 1 }
eof { send_user "\nSSH Connection To $hostname Failed\n"; exit 1 }
"*assword:" { send "$passwordNagios\r" }
}

expect "*622-001 ~]$ "

#Arguments List


send "/home/USERNAME/scripts/policyinstallPost.sh $caulusGood $internetvpnGood $internetinternalGood $internetexternalGood $pftaGood $myersGood $publicsafetyGood $eocGood $telephonyGood $aviationGood $medicGood\r"

expect "*622-001 ~]$ "

send "exit\r"

expect eof
