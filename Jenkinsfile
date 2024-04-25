pipeline {
  agent any

  stages {
    stage('building image') {
      steps {
        bat 'docker image build -t $JOB_NAME:v1.$BUILD_ID .'
        bat 'docker image tag $JOB_NAME:v1.$BUILD_ID alilotfi/$JOB_NAME:latest'
      }
    }

    stage('Ansible version') {
      steps {
        script {
          
          bat 'ansible --version'

        }
      }
    }

    stage('Ansible Deploy') {

      steps {

        bat 'start /B ansible-playbook -i /etc/ansible/hosts -u ubuntu /var/lib/jenkins/workspace/jenkins-docker-ansible/ansible/play.yml'

      }
    }
  }
}
