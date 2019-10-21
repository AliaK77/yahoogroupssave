#/bin/bash
groupname=$1
first=$2
total=$3
datestamp="$(date +"%Y-%m-%d")"
txtfilename="yahoogroup-"$groupname"-"$datestamp".txt"

# print field headings
echo "\"Date\" \"PostId\" \"AuthorName\" \"MessageBody\" " > $txtfilename

for (( i=$first; i <= $total; i++ ))
###for (( i=1; i <= $total; i++ ))
do
  filename="yahoogroup-$groupname-$datestamp-$i.json"
  yahoogroupurl="https://groups.yahoo.com/api/v1/groups/"$groupname"/messages/$i"
  curl ${yahoogroupurl} -sS -o $filename
  
  grep ygError $filename > yhgError.txt
  test -s yhgError.txt
  if [ $? = 0 ]
  then
    echo "message number $i doesn't exist so skipping it"
    rm $filename
  else
    echo "saved yahoo group $groupname conversation page number: $i -- url: $yahoogroupurl into $filename"
    cat $filename |jq .ygData.postDate |jq 'tonumber' |jq 'todate' > tmpfileygapi.txt
    cat $filename | jq '.ygData.msgId, .ygData.authorName, .ygData.messageBody' >> tmpfileygapi.txt
    paste -s -d ' ' tmpfileygapi.txt >> $txtfilename
  fi
  rm yhgError.txt 
done
rm tmpfileygapi.txt
echo "======================================================================================="
echo "======= extracted Date, PostId, AuthorName, MessageBody into $txtfilename   ==========="
echo "======================================================================================="
### cat $txtfilename
### echo "======================================================================================="
