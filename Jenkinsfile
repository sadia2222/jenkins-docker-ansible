pipeline {
    agent any

    environment {
        DOCKER_IMAGE_TAG = "ansibleimg:v1.${BUILD_ID}"
        DOCKER_REPO = "sadiaarshad/cd_midlabpipeline"
        ANSIBLE_PLAYBOOK_PATH = "ANSIBLE_PLAYBOOK_PATH = "/var/lib/jenkins/workspace/cd_midlabpipeline/ansible/subdirectory/play.yml"
"
    }

    stages {
        stage('Build Docker Image') {
            steps {
                script {
                    // Build Docker image
                    bat "docker build -t ${DOCKER_IMAGE_TAG} ."
                }
            }
        }
        
        stage('Push Docker Image') {
            steps {
                script {
                    // Tag the Docker image
                    bat "docker tag ${DOCKER_IMAGE_TAG} ${DOCKER_REPO}:latest"
                    // Push the Docker image to Docker Hub
                    bat "docker push ${DOCKER_REPO}:latest"
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
                // Run Ansible playbook
                bat "docker run --rm ${DOCKER_REPO}:latest ansible-playbook -i /etc/ansible/hosts -u ubuntu ${ANSIBLE_PLAYBOOK_PATH}"
            }
        }
    }
    
    post {
        failure {
            echo 'Pipeline failed!'
            // Add any additional error handling steps here
        }
    }
}
