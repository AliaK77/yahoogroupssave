# yahoogroupssave
save messages from yahoo groups as html or json files

there's a couple of scripts:

- yhgapi-singlejson.sh = a shell script to use yahoo groups api to create individual json files for each post, then merge them all into a text file under headings: "Date" "PostId" "AuthorName" "MessageBody". this works for public and private yahoo groups.

- yahoogroupssave.sh = a shell script to curl / save each yahoo groups conversations page into a html file. it only works for yahoo groups that have messages/conversations open for all to read. ie it doesn't work for private groups as I haven't added authentication to the curl command

to run either scripts
- download the .sh files & set to executable using chmod +x (scriptfilename).sh
- goto your yahoo groups page, note the last message id for latest message (or for however many you want to save): eg one of my group's has 116 msgs
- run the script from terminal: ./(script-filenanme).sh (group-name) (last-message-number)
eg: for one of my yahoogroups groups, group-name=brizbeats & last-message-number=116 (https://groups.yahoo.com/neo/groups/brizbeats)
run the script/s like this: 
- ./yahoogroupssave.sh brizbeats 116
- ./yhgapi-singlejson.sh brizbeats 116

