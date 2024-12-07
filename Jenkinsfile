// pipeline {
//     agent any
//     stages {
//         stage('Build and Push Docker Image') {
//             steps {
//                 script {
//                     // Authenticate with Docker Hub using the saved credentials
//                     docker.withRegistry('https://index.docker.io/v1/', 'dockerhub-credentials') {
//                         // Build the Docker image with the specified name and tag
//                         def app = docker.build("sagar01dev/ci-cd-demo:latest")
                        
//                         // Push the image to Docker Hub
//                         app.push()
//                     }
//                 }
//             }
//         }
//     }
// }

pipeline {
    agent any
    environment {
        DOCKERHUB_CREDENTIALS = credentials('docker-hub-credentials') // Replace with your credential ID in Jenkins
        DOCKER_IMAGE = 'sagar01dev/ci-cd-demo' // Replace with your Docker Hub repository
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
                    sh 'docker build -t $DOCKER_IMAGE .'
                }
            }
        }
        stage('Push to Docker Hub') {
            steps {
                script {
                    sh '''
                    echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin
                    docker push $DOCKER_IMAGE
                    '''
                }
            }
        }
    }
}
