#!/usr/bin/env groovy
import groovy.json.JsonSlurper
pipeline {
    agent any
    environment {

        DOCKER_IMAGE_NAME = "Dockerfile"
    }
    stages {
        stage('build pod') {
            when{
                branch 'master'
            }
            steps {
                //script{
                    configs: 'pod.yml'
                    enableConfigSubstitution: true
               // }
            }
        }
        stage('build docker image') {
            when{
                branch 'master'
            }
            steps {
                script{
                    image=docker.build(DOCKER_IMAGE_NAME)
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