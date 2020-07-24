# cat benchmarked_app.log | awk -F' ' '{print $9, $7, $11}' | sort | sed -e 's/\d+.json//g' | sed -e 's/?.* / /g' | sed -e 's/\/[0-9]*.json/\/000/g'
cat benchmarked_app.log | awk -F' ' '{print $9, $7, $11}' | sort | sed -e 's/\d+.json//g' | sed -e 's/?.* / /g' | sed -e 's/\/[0-9]*.json/\/000/g' | sed -e 's/upload\/.*.jpg/upload\/someimage\.jpg/g'
