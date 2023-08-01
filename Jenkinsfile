pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/your-github-account/your-repo.git'
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    dockerImage = docker.build("my-php-app", "-f Dockerfile .")
                }
            }
        }
        stage('Push Docker Image') {
            steps {
                script {
                    docker.withRegistry('https://your-registry.com', 'your-credentials-id') {
                        dockerImage.push("latest")
                    }
                }
            }
        }
        stage('Deploy Docker Image') {
            steps {
                script {
                    sshagent(['your-credentials-id']) {
                        sh """
                            ssh your-user@your-server 'docker pull your-registry.com/my-php-app:latest && docker run -d -p 443:443 --name my-running-app your-registry.com/my-php-app:latest'
                        """
                    }
                }
            }
        }
    }
}
