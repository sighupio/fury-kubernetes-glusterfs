# Fury Kubernetes Glusterfs


# Topology changes
The topology.json file defines what resources are available to heketi to provision volumes. 
- add disks
- add machines

To apply the new topology configuration this command must be run inside the heketi pod in the storage namspace.
`heketi-cli --user=admin --secret=<admin-token> topology load --json=/etc/heketi/topology.json` 
> `admin-token` is found in `heketi.json`
