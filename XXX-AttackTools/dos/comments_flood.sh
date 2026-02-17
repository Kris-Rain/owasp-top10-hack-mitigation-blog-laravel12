#!/bin/bash
# URL
URL="http://127.0.0.1:8000/articles/1/comments" # Use correct target URL
# Max requests to send
MAX_REQUESTS=100
# Get csrf token
CSRF_TOKEN="MWuBJZde8rgUbtRiYJQWTjZ1mRDSC7HeYKXJxvlk" # Use correct csrf token
# Use actual session cookie
SESSION_COOKIE="laravel_session=eyJpdiI6Ik5mYXhhSHliSDk2UHc0OGNvTWFic2c9PSIsInZhbHVlIjoiQ0pWaWxBZWVOaVF2cFhaTTRrVlBGQit1VC9COFBGS2FVSFFFOFpQRDNXdm9GU3ErT0NNWmVjWE0yMkZPQmViWE96VFl3SHpaUno4empUNkJoVm83ZlNwcGlSYS8wa1luZEpJTVRYaHV4R3UwaW9vTFZwb3JjTE5peXhhampoZDgiLCJtYWMiOiIzZTQ3YTMzMjczMzM5NTVkZTFlNGM1YWMyMWQzYjAzOGZkZDJmOWMzMjhlMTkxODUzZGM0NWFmZDkwMTFlMWVhIiwidGFnIjoiIn0=" # Use correct session cookie

# Send a comment including csrf token
send_comment() {
    local comment_number=$1
    curl -s -H "Cookie: $SESSION_COOKIE" -X POST -d "content=Questo è un commento di prova $1&_token=$CSRF_TOKEN" "$URL"
}
# Sending multiple comments
for ((i = 1; i <= MAX_REQUESTS; i++))
do
    send_comment $i
    echo "Comment $i sent"
done