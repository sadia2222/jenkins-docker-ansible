pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                script {
                    // Git repository URL
                    def gitRepoUrl = "https://github.com/sadia2222/jenkins-docker-ansible.git"

                    // Checkout from Git without specifying credentials ID
                    checkout([$class: 'GitSCM',
                              branches: [[name: 'main']],
                              userRemoteConfigs: [[url: gitRepoUrl]]])
                }
            }
        }


    stages {
        stage('Build Docker Image') {
            steps {
                script {
                    def dockerImageTag = "${JOB_NAME}:v1.${BUILD_ID}"
                    bat "docker build -t ansibleimage ."
                    bat "docker tag ansibleimage:latest sadiaarshad/${JOB_NAME}:latest"
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
               bat "docker run --rm sadiaarshad/ansibleimage:latest ansible-playbook -i /etc/ansible/hosts -u ubuntu /var/lib/jenkins/workspace/jenkins-docker-ansible/ansible/play.yml"

            }
        }
    }
}
