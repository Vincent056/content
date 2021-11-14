#!/bin/bash
# create a cluster resource quota
cat << EOF | oc apply -f -
apiVersion: v1
kind: ClusterResourceQuota
metadata:
  name: for-test-project
spec:
  quota:
    hard:
      pods: "10"
      secrets: "20"
  selector:
    annotations: null
    labels:
      matchLabels:
        name: test-project
EOF