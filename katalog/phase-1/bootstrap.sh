#!/bin/sh

set -e
set -x

cd /root
sleep 30
## Starting bootstrapping
heketi-cli topology info
heketi-cli topology load --json=${TOPOLOGY_PATH}
heketi-cli topology info
heketi-cli setup-openshift-heketi-storage
kubectl apply -f heketi-storage.json

# Letting the job finishing
# sleep 30
# Cleaning up himselft
# kubectl delete deploy,svc heketi-bootstrap -n storage
# kubectl delete job heketi-storage-copy-job -n storage
# kubectl delete job init-heketi -n storage