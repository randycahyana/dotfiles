#!/bin/sh

export http_proxy="http://${PROXY_IP}:${PROXY_PORT}" 
export https_proxy="https://${PROXY_IP}:${PROXY_PORT}" 

echo ">> on http/s proxy: ${http_proxy}"
