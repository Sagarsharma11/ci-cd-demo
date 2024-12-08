pipeline {
    agent any
    environment {
        DOCKERHUB_CREDENTIALS = credentials('dockerhub-credentials') // Ensure this matches the actual Jenkins credentials ID
        DOCKER_IMAGE = 'sagar01dev/ci-cd-demo' // Your Docker Hub repository
    }
    stages {
        stage('Checkout Code') {
            steps {
                git branch: 'main', url: 'https://github.com/Sagarsharma11/ci-cd-demo.git'
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    sh 'docker build -t $DOCKER_IMAGE:latest .'
                }
            }
        }
        stage('Push to Docker Hub') {
            steps {
                script {
                    sh '''
                    echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin
                    docker pull $DOCKER_IMAGE:latest || true
                    docker push $DOCKER_IMAGE:latest
                    '''
                }
            }
        }
    }
}
