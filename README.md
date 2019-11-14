# Fury Kubernetes Glusterfs


# Topology changes
The topology.json file defines what resources are available to [heketi](https://github.com/heketi/heketi) to provision volumes. 
- add disks
- add machines

To apply the new topology configuration this command must be run inside the heketi pod in the storage namspace.
`heketi-cli --user=admin --secret=<admin-token> topology load --json=/etc/heketi/topology.json` 
> `admin-token` is found in `heketi.json`

## Glusterfs Packages

Following packages are included in Fury Kubernetes Glusterfs katalog:

- [heketi](katalog/phase-2): Heketi is a Gluster Volume manager that 
provides a RESTful interface to create/manage Gluster volumes. Version: **7**

Following packages are included in Fury Kubernetes Glusterfs roles:

- [Glusterfs](roles): Gluster is a scalable, distributed file system 
that aggregates disk storage resources from multiple servers into 
a single global namespace. Version: **4.X**


## Compatibility

| Module Version / Kubernetes Version | 1.14.X             | 1.15.X             | 1.16.X             |
|-------------------------------------|:------------------:|:------------------:|:------------------:|
| v1.0.0                              |                    |                    |                    |

- :white_check_mark: Compatible
- :warning: Has issues
- :x: Incompatible
