#!/usr/bin/env groovy
import groovy.json.JsonSlurper
pipeline {
    agent {
        kubernetes {
            yaml """
    apiVersion: v1
    kind: Pod
    metadata:
      name: centos-pod
    spec:
      serviceAccountName: jenkins
      containers:
      - name: uses-docker-image
        image: $DOCKER_IMAGE_NAME
        command: [ "echo", "SUCCESS" ]
        resources:
          limits:
            memory: "200Mi"
          requests:
            memory: "100Mi"
    """
        }
    }
    stages{
        stage('build docker image') {
            when{
                branch 'master'
            }
            steps {
                script{
                    image = docker.build(DOCKER_IMAGE_NAME)
                    image.inside{
                           sh 'echo DONE!!!'
                    }
                }
            }
        }
        stage('Deploy'){
            steps {
                kubernetesDeploy(
                    kubeconfigId: 'kubeconfig',
                    configs: 'services.yml',
                    enableConfigSubstitution: true
                )
            }
        }
    }
}