pipeline {
        DOCKER_IMAGE_NAME="Dockerfile"
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
        """
        }
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