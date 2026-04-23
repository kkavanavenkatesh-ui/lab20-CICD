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
                // Changing to 'package' so it creates the .war file
                bat 'mvn clean package' 
            }
        }

        stage('Build Docker Image') {
            steps {
                // This builds the image using the Dockerfile we discussed
                bat 'docker build -t sample-webapp .'
            }
        }

        stage('Stop & Remove Old Container') {
            steps {
                // This cleans up old runs so the name and port don't conflict
                bat 'docker stop sample-webapp-container || exit 0'
                bat 'docker rm sample-webapp-container || exit 0'
            }
        }

        stage('Deploy Container') {
            steps {
                // IMPORTANT: Mapping port 8087 (outside) to 8080 (inside Tomcat)
                bat 'docker run -d -p 8087:8080 --name sample-webapp-container sample-webapp'
            }
        }
    }

    post {
        always {
            junit allowEmptyResults: true, testResults: '**/target/surefire-reports/*.xml'
        }
        success {
            echo 'App is live! Try: http://localhost:8087/ROOT'
        }
    }
}
