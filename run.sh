#!/bin/bash
user=$(awk -F "=" '/user/ {print $2}' jenkins_job.ini)
password=$(awk -F "=" '/password/ {print $2}' jenkins_job.ini)
C:/Users/SudharshanMuralidhar/AppData/Local/Programs/Python/Python39/python.exe -m venv .
source ./Scripts/activate      
pip install jenkins-job-builder
jenkins-jobs --conf ./jenkins_jobs.ini update  ./go-lms-pipeline.yaml --delete-old
curl -X POST -u "${user}":"${password}" \
  --data-urlencode json='{"parameter": [{"name":"PORT", "value":"3000"}]}' \
  http://localhost:8080/job/new-test-jjb-105/build


