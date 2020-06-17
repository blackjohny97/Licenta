#!/usr/bin/env groovy
import groovy.json.JsonSlurper
pipeline {
    agent {
        kubernetes {
            label 'train-schedule-app'
            yamlFile 'pod.yml'
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