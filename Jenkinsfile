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
                // Creates the .jar or .war file
                bat 'mvn clean package -DskipTests'
                
                // Finds the file and renames it to app.binary in the root
                bat 'for /r %%i in (*.war *.jar) do copy /Y "%%i" "app.binary"'
            }
        }

        stage('Build Docker Image') {
            steps {
                // Builds the image using the Dockerfile in the current directory
                bat 'docker build -t sample-webapp .'
            }
        }

        stage('Clean Old Container') {
            steps {
                // Stops and removes the old container to free up port 8087
                bat 'docker stop sample-webapp-container || exit 0'
                bat 'docker rm sample-webapp-container || exit 0'
            }
        }

        stage('Deploy') {
            steps {
                // Maps your PC port 8087 to Container port 8080
                bat 'docker run -d -p 8087:8080 --name sample-webapp-container sample-webapp'
            }
        }
    }

    post {
        success {
            echo 'SUCCESS! Wait 30 seconds for Tomcat to boot, then visit http://localhost:8087'
        }
        failure {
            echo 'Build Failed. Check the Console Output above.'
        }
    }
}
