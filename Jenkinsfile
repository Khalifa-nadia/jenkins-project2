pipeline {
    agent any

    environment {
        IMAGE_NAME = "nadiakhalifa/flask-app"
    }

    stages {

        stage('Clone') {
            steps {
                git branch: 'main', url: 'https://github.com/Khalifa-nadia/jenkins-project2.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $IMAGE_NAME .'
            }
        }

        stage('Login to Docker Hub') {
            steps {
                withCredentials([usernamePassword(
                    credentialsId: '49991a7d-7d40-4b53-ae3d-ea44553b7e61',
                    usernameVariable: 'USER',
                    passwordVariable: 'PASS'
                )]) {
                    sh 'echo $PASS | docker login -u $USER --password-stdin'
                }
            }
        }

        stage('Push Image') {
            steps {
                sh 'docker push $IMAGE_NAME'
            }
        }
    }
}