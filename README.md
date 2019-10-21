# yahoogroupssave
save messages from yahoo groups as html or json files

there's a couple of scripts:

- yhgapi-save-to-json.sh = a shell script to use yahoo groups api to create individual json files for each post, then merge them all into a text file under headings: "Date" "PostId" "AuthorName" "MessageBody". can specify first & last msg now too to do in batches. & the json version now skips the messages that don't exist

- yhg-save-to-html.sh = a shell script to curl / save each yahoo groups conversations page into a html file. it only works for yahoo groups that have messages/conversations open for all to read. ie it doesn't work for private groups as I haven't added authentication to the curl command. can specify first & last msg now too to do in batches.

to run either scripts
- download the .sh files & set to executable using chmod +x (scriptfilename).sh
- goto your yahoo groups page, note the last message id for latest message (or for however many you want to save): eg one of my group's has 116 msgs
- run the script from terminal: ./(script-filenanme).sh (group-name) (first-message-number) (last-message-number)
eg: for one of my yahoogroups groups, group-name=brizbeats & last-message-number=116 (https://groups.yahoo.com/neo/groups/brizbeats)
run the script/s like this: 
- ./yhg-save-to-html.sh brizbeats 1 116
- ./yhgapi-save-to-json.sh brizbeats 1 116

