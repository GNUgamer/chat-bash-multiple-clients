#!/bin/bash
#clientscript

echo Write ip-adress to the nc-server:
read ipadress

echo Write portnumber to the nc-server 

read port
echo Write your username, WITH NO WHITESPACES:
read user

host_name=$user

output=ut_$user
rm -f $output

mkfifo $output                  

server() {
  tail -f $output | nc $ipadress $port      
}

calling() {
   while [ 1 ]; do
    read message    
 echo $host_name: $message > $output   
  done;
 }
 
 server & echo Connected & echo $host_name _ is connected to the call > $output 
calling








