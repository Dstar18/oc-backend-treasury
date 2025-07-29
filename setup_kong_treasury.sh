#!/bin/bash

KONG_ADMIN="http://172.18.241.151:8001"

# 1. Buat service
curl -i -X POST $KONG_ADMIN/services \
  --data name=treasury-service \
  --data url='http://172.18.241.151:8041'

# 2. Buat route dengan strip_path=false
curl -i -X POST $KONG_ADMIN/services/treasury-service/routes \
  --data 'paths[]=/api/treasury' \
  --data 'strip_path=false'

# 3. Tambah plugin validate-token
curl -i -X POST $KONG_ADMIN/services/treasury-service/plugins \
  --data "name=validate-token"
