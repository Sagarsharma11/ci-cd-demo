pipeline {
    agent any
    environment {
        DOCKERHUB_CREDENTIALS = credentials('dockerhub-credentials') // Jenkins credential ID
        DOCKER_IMAGE = 'sagar01dev/ci-cd-demo' // Docker Hub repository
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
                recipientProviders: [[$class: 'CulpritsRecipientProvider']], // Use this for SCM committers
                to: 'sagarsharmatech00@gmail.com',
                from: 'your_email@example.com', // Ensure this matches your SMTP sender
                replyTo: 'your_email@example.com'
            )
        }
    }
}
