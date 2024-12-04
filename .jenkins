stage('Build and Push Docker Image') {
    steps {
        script {
            // Authenticate with Docker Hub using the saved credentials
            docker.withRegistry('https://index.docker.io/v1/', 'dockerhub-credentials') {
                // Build the Docker image with the specified name and tag
                def app = docker.build("sagar01dev/ci-cd-demo:latest")
                
                // Push the image to Docker Hub
                app.push()
            }
        }
    }
}
