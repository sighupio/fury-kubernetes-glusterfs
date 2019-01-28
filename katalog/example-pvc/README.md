In order to create new Persistent Volume Claim (PVC) using GlusterFS as provider create a new YAML file:

<pre>
kind: PersistentVolumeClaim
apiVersion: v1
metadata:
  <b>name</b>: <i>panini-vol</i>
  annotations:
    volume.beta.kubernetes.io/storage-class: gluster
spec:
  <b>accessModes</b>:
    - <i>ReadWriteMany</i>
  resources:
    requests:
      <b>storage</b>: <i>5Gi</i>
</pre>


**name** => name you would life to reference your new PVC

**accessModes** => can be of type:

	ReadWriteOnce – the volume can be mounted as read-write by a single node
	ReadOnlyMany – the volume can be mounted read-only by many nodes
	ReadWriteMany – the volume can be mounted as read-write by many nodes

**storage** => size of your volume

Once the the PVC has been claimed by simply:
`kubectl apply -f /path/to/your/yaml`

You should see an output like the one below in case of success:

`persistentvolumeclaim "CHOSENNAME" created`

Attaching a PVC provided by GlusterFS to a POD is done in the same way you would attach a generic volume. Please check the highlighted block below:

<pre>
kind: Deployment
apiVersion: apps/v1beta1
metadata:
  name: testing-pvc
  labels:
    app: test
spec:
  replicas: 1
  template:
    metadata:
      name: testing-pvc
      labels:
        app: test
    spec:
      containers:
      - name: alpine
        image: alpine:latest
        command:
          - /bin/sleep
          - "3600"
        <i>volumeMounts:
        - name: db
          mountPath: "/var/lib/data"</i>
      <b>volumes:
        - name: db
          persistentVolumeClaim:
            claimName: test-panini</b>
</pre>

in <b>bold</b> the volume definition and in <i>cursive</i> the volume mountpoint inside the POD
