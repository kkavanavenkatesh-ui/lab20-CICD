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
        stage('Build & Package') {
            steps {
                // This creates the artifact
                bat 'mvn clean package -DskipTests'
                
                // This command finds the built file (war or jar) and renames it to app.binary
                // It looks in all subfolders just in case your pom.xml is not in the root
                bat 'for /r %%i in (*.war *.jar) do copy "%%i" "app.binary"'
            }
        }
        stage('Build Docker Image') {
            steps {
                bat 'docker build -t sample-webapp .'
            }
        }
        stage('Deploy') {
            steps {
                bat 'docker stop sample-webapp-container || exit 0'
                bat 'docker rm sample-webapp-container || exit 0'
                bat 'docker run -d -p 8087:8080 --name sample-webapp-container sample-webapp'
            }
        }
    }
    post {
        success {
            echo 'SUCCESS! Visit http://localhost:8087'
        }
    }
}
