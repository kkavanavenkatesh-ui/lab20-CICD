pipeline {
    agent any

    tools {
        jdk 'jdk17'
        maven 'Maven3'
    }

    stages {
        stage('Checkout') {
            steps {
                // Ensure this URL is correct for your repository
                git "https://github.com/kkavanavenkatesh-ui/lab20-CICD.git"
            }
        }

        stage('Build & Package') {
            steps {
                // Compile the code and create the JAR file
                bat 'mvn clean package -DskipTests'
                
                // Finds the JAR file in /target and copies it to the root as app.binary
                // This ensures the Dockerfile 'COPY' command always works
                bat 'for /r %%i in (*.war *.jar) do copy /Y "%%i" "app.binary"'
            }
        }

        stage('Build Docker Image') {
            steps {
                // Builds the Docker image using the Dockerfile
                bat 'docker build -t sample-webapp .'
            }
        }

        stage('Deploy') {
            steps {
                // Stop and remove old containers to avoid port or name conflicts
                bat 'docker stop sample-webapp-container || exit 0'
                bat 'docker rm sample-webapp-container || exit 0'
                
                // Run the new container: Maps Host Port 8087 to Container Port 8080
                bat 'docker run -d -p 8087:8080 --name sample-webapp-container sample-webapp'
            }
        }
    }

    post {
        success {
            echo 'PIPELINE SUCCESSFUL!'
            echo 'Access your app at: http://localhost:8087'
        }
        failure {
            echo 'PIPELINE FAILED. Please check the Console Output for errors.'
        }
    }
}
