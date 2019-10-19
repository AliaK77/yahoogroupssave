#/bin/bash
groupname=$1
total=$2
datestamp="$(date +"%Y-%m-%d")"
txtfilename="yahoogroup-"$groupname"-"$datestamp".txt"

# print field headings
echo "\"Date\" \"PostId\" \"AuthorName\" \"MessageBody\" " > $txtfilename

for (( i=1; i <= $total; i++ ))
do
  filename="yahoogroup-$groupname-$datestamp-$i.json"
  yahoogroupurl="https://groups.yahoo.com/api/v1/groups/"$groupname"/messages/$i"
  echo "saving yahoo group $groupname conversation page number: $i -- url: $yahoogroupurl into $filename"
  curl ${yahoogroupurl} -sS -o $filename

### removed this as there's a strange bug where it does a directory listing of the folder into the text file (not in json). will look at this later - this format is for me anyway
#   postdatetext=$(cat $filename |jq .ygData.postDate |jq 'tonumber' |jq 'todate' )
#   loop=$(cat $filename | jq '.ygData.msgId, .ygData.authorName, .ygData.messageBody')
#   echo $postdatetext > tmpfileygapi.txt
#   echo $loop >> tmpfileygapi.txt
#   paste -s -d ' ' tmpfileygapi.txt >> $txtfilename

done
echo "======================================================================================="
#cat $txtfilename
