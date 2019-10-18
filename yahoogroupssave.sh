#/bin/bash
groupname=$1
total=$2
datestamp="$(date +"%Y-%m-%d")"
filename="yahoogroup-"$groupname"-"$datestamp"-.html"
for (( i=1; i <= $total; i++ ))
do
#  echo "date = "$datestamp
#  echo "page number = $i"
  filename="yahoogroup-$groupname-$datestamp-$i.html"
  yahoogroupurl="https://groups.yahoo.com/neo/groups/"$groupname"/conversations/messages/$i"
  echo "saving yahoo group $groupname conversation page number: $i -- url: $yahoogroupurl into $filename"
  ###curl -sS $yahoogroupurl > $filename
  curl ${yahoogroupurl} -sS -o $filename
  ### adding a sleep / delay to slow it down; uncomment the 'sleep 10' line below if you want to use this
  ### may need this if the group has a large number of messages so it doesn't flood their site. 
  ### adjust the delay as needed, it will just take longer to run the script
  ### sleep 10
done
