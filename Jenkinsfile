pipeline {
    agent any

    tools {
        jdk 'jdk17'
        maven 'Maven3'
    }

    stages {
        stage('Checkout') {
            steps {
                git "https://github.com/kkavanavenkatesh-ui/lab20-CICD.git"
            }
        }

        stage('Build & Test') {
            steps {
                bat 'mvn clean test'
            }
        }
    }

    post {
        always {
           junit allowEmptyResults: true, testResults: '**/target/surefire-reports/*.xml'
        }
    }
}
