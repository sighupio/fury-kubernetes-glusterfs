# Glusterfs Installation process

sc.yml
```yaml
kind: StorageClass
apiVersion: storage.k8s.io/v1beta1
metadata:
  name: gluster
provisioner: kubernetes.io/glusterfs
parameters:
  resturl: "http://10.0.0.7:8080"
  restuser: admin
  secretNamespace: storage
  secretName: heketi-admin-pwd
```

kustomization.yaml
```yaml
namespace: storage]

resources:
- sc.yml

secretGenerator:
  - name: heketi-mgmt
    commands:
	  heketi.json: "cat heketi.json"
      key.pem: "terraform.pem"
      topology.json: "topology.json"
    type: Opaque
  - name: heketi-admin-pwd
    type: kubernetes.io/glusterfs
    commands: 
	  token:  "cat heketi.json | jq .jwt.admin.key -r | tr -d \'\n\'"
```

hekety.json
```json
{
	"_port_comment": "Heketi Server Port Number",
	"port" : "8080",

	"_use_auth": "Enable JWT authorization. Please enable for deployment",
	"use_auth" : true,

	"_jwt" : "Private keys for access",
	"jwt" : {
		"_admin" : "Admin has access to all APIs",
		"admin" : {
			"key" : "normalUserAccess"
		},
		"_user" : "User only has access to /volumes endpoint",
		"user" : {
			"key" : "superAdminAccess"
		}
	},

	"_glusterfs_comment": "GlusterFS Configuration",
	"glusterfs" : {

		"_executor_comment": "Execute plugin. Possible choices: mock, kubernetes, ssh",
		"executor" : "ssh",

		"_db_comment": "Database file name",
		"db" : "/var/lib/heketi/heketi.db",
		
		"sshexec" : {
			"rebalance_on_expansion": true,
			"keyfile" : "/etc/heketi/key.pem",
			"user": "root",
			"port": "22"
		}
	},

	"backup_db_to_kube_secret": true
}
```

