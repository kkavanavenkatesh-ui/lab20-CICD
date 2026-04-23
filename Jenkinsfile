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
                // 1. Compile the code
                bat 'mvn clean package'
                
                // 2. THE FIX: Copy the war file to the current root directory as 'app.war'
                // This ensures Docker doesn't have to look inside the /target folder
                bat 'copy target\\*.war app.war'
            }
        }

        stage('Build Docker Image') {
            steps {
                // Build using the simplified path
                bat 'docker build -t sample-webapp .'
            }
        }

        stage('Clean Old Container') {
            steps {
                bat 'docker stop sample-webapp-container || exit 0'
                bat 'docker rm sample-webapp-container || exit 0'
            }
        }

        stage('Deploy') {
            steps {
                // Map external 8087 to internal 8080 (Tomcat default)
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
