def REGISTRY = 'https://index.docker.io/v1/'
def GIT_REPO = 'https://github.com/Syauqi-ty/Olin-Test.git'
def AWS_UBUNTU = '18.143.199.171'
def SSH_ID = 'SSH-AWS'
pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git "${GIT_REPO}"
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    dockerImage = docker.build("syauqittuqa/olin-php:latest", "-f Dockerfile .")
                }
            }
        }
        stage('Push Docker Image') {
            steps {
                script {
                    docker.withRegistry('https://index.docker.io/v1/', 'Syauqi-Docker') {
                        dockerImage.push("latest")
                    }
                }
            }
        }
        stage('Deploy Docker Image') {
            steps {
                script {
                    sshagent(['SSH-AWS']) {
                        sh """
                            ssh -l ubuntu 13.229.0.153 -o StrictHostKeyChecking=no 'docker pull syauqittuqa/olin-php:latest && docker run -d -p 80:80 syauqittuqa/olin-php:latest'
                        """
                    }
                }
            }
        }
    }
}
