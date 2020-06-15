pipeline {
    environment {
        DOCKER_IMAGE_NAME="Dockerfile"
    }
    agent {
        kubernetes {
            yaml """
        apiVersion: v1
        kind: Cluster
        spec:
            cluster-version: 1.16.8
            machine-type: n1-standard-2
            nodes: 2
            serviceAccountName: jenkins
            containers:
            - name: train-app
              image: $DOCKER_IMAGE_NAME
             //aici trebuie sa termin configurarea pt kubernetes dar nu stiu daca trebuie onfiguratie de pod sau cluster

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