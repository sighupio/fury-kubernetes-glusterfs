
apply-first:
	kustomize build phase-1 | kubectl apply -f -

clean-first:
	kubectl delete job heketi-storage-copy-job init-heketi -n storage
	kubectl delete deploy,svc heketi-bootstrap -n storage

apply-second:
	kustomize build phase-2 | kubectl apply -f -

apply-third:
	kustomize build phase-3 | kubectl apply -f -
