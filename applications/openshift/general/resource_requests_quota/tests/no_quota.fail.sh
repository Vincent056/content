#!/bin/bash

# remediation = none

yum install -y jq

kube_apipath="/kubernetes-api-resources"

mkdir -p "$kube_apipath/apis/quota.openshift.io/v1"

quota_apipath="/apis/quota.openshift.io/v1/clusterresourcequotas?limit=500"

# This file assumes there is no cluster qouta object
cat <<EOF > "$kube_apipath$quota_apipath"
{
    "apiVersion": "v1",
    "items": [
    ],
    "kind": "List",
    "metadata": {
        "resourceVersion": "",
        "selfLink": ""
    }
}
EOF