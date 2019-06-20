curl -m 4  \
    -X "POST" \
    -v "http://192.168.11.82:30076/test/test" \
    -H "Accept: application/json"  \
    -H "ContentType: application/json" \
    -H "Expect:" \
    --http2 \
    --data-ascii "@af_crt.json"

#./http2_client -h 192.168.11.82 -p 30076 -u -v -c 10