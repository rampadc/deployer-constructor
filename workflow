apiVersion: argoproj.io/v1alpha1
kind: Workflow
metadata:
  generateName: tekton-pipeline-
  namespace: default
spec:
  entrypoint: pipeline-dag
  serviceAccountName: pipeline
  templates:
    - name: pipeline-dag
      dag:
        tasks:
          - name: run-oc-1739878458996
            template: run-oc-1739878458996
    - name: run-oc-1739878458996
      container:
        image: quay.io/openshift/origin-cli:latest
        command:
          - /bin/bash
        args:
          - "-c"
          - echo "Hello World"
