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
    post {
        always {
            emailext(
                subject: "Build Notification: ${currentBuild.fullDisplayName}",
                body: """Build Details:
                - Job Name: ${env.JOB_NAME}
                - Build Number: ${env.BUILD_NUMBER}
                - Status: ${currentBuild.currentResult}
                - URL: ${env.BUILD_URL}
                """,
                recipientProviders: [[$class: 'DevelopersRecipientProvider']],
                to: 'your_email@example.com' // Replace with your email
            )
        }
    }
}
