curl 10.0.5.42:8000 -X POST --header "X-Messages:$(echo -n "reset" | base64)"
curl 10.0.5.42:8000 -X POST --header "X-Messages:"$(echo "$(echo "$($3 $1 $2)" | base64 )" | tr -d '\n')""
