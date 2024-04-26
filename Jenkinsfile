pipeline {
    agent any

    stages {
        stage('Build Docker Image') {
            steps {
                script {
                    def dockerImageTag = "${JOB_NAME}:v1.${BUILD_ID}"
                    // Build Docker image
                    bat "docker build -t ansibleimage ."
                    // Tag the Docker image
                    bat "docker tag ansibleimage:latest sadiaarshad/${JOB_NAME}:latest"
                }
            }
        }
        
        stage('Push Docker Image') {
            steps {
                script {
                    // Authenticate with Docker Hub
                    withCredentials([usernamePassword(credentialsId: 'dockerhub_credentials', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
                        // Login to Docker Hub
                        bat "docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWORD"
                        // Push the Docker image to Docker Hub
                        bat "docker push sadiaarshad/${JOB_NAME}:latest"
                    }
                }
            }
        }
        
        stage('Run Tests') {
            steps {
                // You can add your test scripts or commands here
                bat "echo Running tests..."
            }
        }
        
        stage('Deploy') {
            steps {
                // Assuming you have Ansible installed in the Docker container
                bat "docker run --rm sadiaarshad/${JOB_NAME}:latest ansible-playbook -i /etc/ansible/hosts -u ubuntu /var/lib/jenkins/workspace/jenkins-docker-ansible/ansible/play.yml"
            }
        }
    }
}
