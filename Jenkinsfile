pipeline {
    agent any

    stages {
        stage('Build Docker Image') {
            steps {
                script {
                    def dockerImageTag = "${JOB_NAME}:v1.${BUILD_ID}"
                    bat "docker build -t ${dockerImageTag} ."
                    bat "docker tag ${dockerImageTag} alilotfi/${JOB_NAME}:latest"
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
                bat "docker run --rm alilotfi/${JOB_NAME}:latest ansible-playbook -i /etc/ansible/hosts -u ubuntu /var/lib/jenkins/workspace/jenkins-docker-ansible/ansible/play.yml"
            }
        }
    }
}
