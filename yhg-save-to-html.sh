#/bin/bash
groupname=$1
first=$2
total=$3
###datetimestamp="$(date +"%Y-%m-%d-%H%M")"
datestamp="$(date +"%Y-%m-%d")"
filename="yahoogroup-"$groupname"-"$datestamp"-.html"
###for (( i=1; i <= $total; i++ ))
for (( i=$first; i <= $total; i++ ))
do
#  echo "date = "$datestamp
#  echo "page number = $i"
  filename="yahoogroup-$groupname-$datestamp-$i.html"
  yahoogroupurl="https://groups.yahoo.com/neo/groups/"$groupname"/conversations/messages/$i"
  echo "saving yahoo group $groupname conversation page number: $i -- url: $yahoogroupurl into $filename"
  ###curl -sS $yahoogroupurl > $filename
  curl ${yahoogroupurl} -sS -o $filename
#  sleep 10
done
