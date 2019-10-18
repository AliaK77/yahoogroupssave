# yahoogroupssave
save messages from yahoogroups as html files


I made a quick & dirty script to save the messages/conversations' pages to html files. it works from my mac ok. (a lot of it is comments, you could remove those lines) one day (likely never get round to it) could extract just the message field. you can move the html files to a directory and search if needed. as I said, it's not pretty but does save the text off at least. and runs pretty quick. I'm sure someone here could make improvements

to run it, 
- goto your yahoogroup page, note the last message id for latest message: eg one of my group's called 'brizbeats' has 116 msgs- save the script into a .sh file & make it executable (ie chmod +x yahoogroupssave.sh)
- run the script from terminal: ./yahoogroupssave.sh <group-name> <last-message-number>
eg: for one of my groups, group-name=brizbeats & last-message-number=116
https://groups.yahoo.com/neo/groups/brizbeats/conversations/messages/116 so run the script like this: ./yahoogroupssave.sh brizbeats 116
for yahoogroups group run it like this (79638 is last message I see atm but this email would +1 it to 79639):./yahoogroupssave.sh videoblogging 79638

you can download the script here or edit the script file yahoogroupssave.sh & add the commands below :


#/bin/bash
groupname=$1
total=$2
datestamp="$(date +"%Y-%m-%d")"
filename="yahoogroup-"$groupname"-"$datestamp"-.html"
for (( i=1; i <= $total; i++ ))
do
#  echo "date = "$datestamp
#  echo "page number = $i"
  filename="yahoogroup-$groupname-$datestamp-$i.html"
  yahoogroupurl="https://groups.yahoo.com/neo/groups/"$groupname"/conversations/messages/$i"
  echo "saving yahoo group $groupname conversation page number: $i -- url: $yahoogroupurl into $filename"
  ###curl -sS $yahoogroupurl > $filename
  curl ${yahoogroupurl} -sS -o $filename
done
