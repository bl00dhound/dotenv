#! /bin/bash
PROTOCOL="http"

while [[ "$1" =~ ^- && ! "$1" == "--" ]]; do case $1 in
  -s | --ssl)
    PROTOCOL="https"
    ;;
esac; shift; done
if [[ "$1" == '--' ]]; then shift; fi


URL=$PROTOCOL://$1/api/common/v1/health/readiness

echo "Send request to '$URL'"

curl -XGET -k  "$URL"
