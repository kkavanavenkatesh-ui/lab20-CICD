pipeline {
    agent any

    tools {
        jdk 'jdk17'
        maven 'Maven3'
    }

    stages {
        stage('Checkout') {
            steps {
                // Ensure this URL is correct for your repo
                git "https://github.com/kkavanavenkatesh-ui/lab20-CICD.git"
            }
        }

        stage('Build & Test') {
            steps {
                // 'package' is mandatory to create the /target folder
                bat 'mvn clean package' 
            }
        }

        stage('Build Docker Image') {
            steps {
                // The dot '.' is critical; it tells Docker to look in the current folder
                bat 'docker build -t sample-webapp .'
            }
        }

        stage('Clean Old Container') {
            steps {
                // Stops and deletes the old version so the new one can use the port
                bat 'docker stop sample-webapp-container || exit 0'
                bat 'docker rm sample-webapp-container || exit 0'
            }
        }

        stage('Deploy') {
            steps {
                // Map external 8087 to internal 8080
                bat 'docker run -d -p 8087:8080 --name sample-webapp-container sample-webapp'
            }
        }
    }

    post {
        always {
            junit allowEmptyResults: true, testResults: '**/target/surefire-reports/*.xml'
        }
        success {
            echo 'SUCCESS! Wait 20 seconds, then visit http://localhost:8087'
        }
    }
}
