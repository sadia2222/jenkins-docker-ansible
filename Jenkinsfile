pipeline {
  agent any

  stages {
    stage('building image') {
      steps {
        sh 'docker image build -t $JOB_NAME:v1.$BUILD_ID .'
        sh 'docker image tag $JOB_NAME:v1.$BUILD_ID alilotfi/$JOB_NAME:latest'
      }
    }

    stage('Ansible version') {
      steps {
        script {
          
          sh 'ansible --version'

        }
      }
    }

    stage('Ansible Deploy') {

      steps {

        sh 'start /B ansible-playbook -i /etc/ansible/hosts -u ubuntu /var/lib/jenkins/workspace/jenkins-docker-ansible/ansible/play.yml'

      }
    }
  }
}
