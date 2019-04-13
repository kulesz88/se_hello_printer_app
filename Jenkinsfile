pipeline {
    agent any
    stages {
        stage('Deps') {
            steps {
	            sh 'make deps'
	            }
        }
        stage('Lint') {
            steps {
              sh 'make lint'
              }
        }
        stage('Test') {
            steps {
              sh 'make test'
              }
        }
    }
}
