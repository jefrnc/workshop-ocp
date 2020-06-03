#!/bin/bash

echo "Demo Tekton"
 
 

oc delete project tekton-bootcamp 

oc new-project tekton-bootcamp

oc apply -f https://raw.githubusercontent.com/GrahamDumpleton-abandoned/lab-openshift-pipelines-with-tekton/master/code/tektontasks/s2i-java-8-task.yaml
oc apply -f imagestream.yaml
oc apply -f resources.yaml
oc apply -f pipeline.yaml
oc apply -f run.yaml
#oc apply -f tk-apply-manifests.yaml
#oc apply -f tk-update-deployment.yaml
#oc apply -f rs.yaml
#oc apply -f build_pipeline.yaml


 #tkn pipeline start build-and-deploy \
  #  -r git-repo=api-repo \
  #  -r image=api-image \
  #  -p deployment-name=vote-api