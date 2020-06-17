pipeline {
    agent any
    environment {

        DOCKER_IMAGE_NAME = "Dockerfile"
    }
    stages {
        stage('build docker image') {
            steps {
                image=docker.build(DOCKER_IMAGE_NAME)
                image.inside{
                       sh 'echo DONE!!!'
                }
            }
        }
        stage('build pod') {
            steps {
                configs: 'pod.yml'
                enableConfigSubstitution: true
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