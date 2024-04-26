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
                    withCredentials([usernamePassword(credentialsId: '02ea6d73-fb7a-46a2-9c49-8558b34153b9', usernameVariable: 'sadiaarshad', passwordVariable: 'DOCKER_PASSWORD')]) {
                        // Login to Docker Hub
                        bat "docker login -u $sadiaarshad -p $DOCKER_PASSWORD"
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
