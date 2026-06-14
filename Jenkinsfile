pipeline {
    agent any

    environment {
        IMAGE_NAME = "omidmoaddab/capstone-app:${BUILD_NUMBER}"
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Maven Build') {
            steps {
                dir('app') {
                    sh 'mvn clean package'
                }
            }
        }

        stage('Docker Build') {
            steps {
                dir('app') {
                    sh 'docker build -t $IMAGE_NAME .'
                }
            }
        }

        stage('Docker Push') {
            steps {
                withDockerRegistry([credentialsId: 'dockerhub', url: '']) {
                    sh 'docker push $IMAGE_NAME'
                }
            }
        }

        stage('Checkov Scan') {
            steps {
                sh 'checkov -d terraform || true'
            }
        }

        stage('Terraform Deploy') {
            steps {
                dir('terraform') {
                    sh 'terraform init'
                    sh 'terraform apply -auto-approve -var="image_name=$IMAGE_NAME"'
                    sh 'terraform output app_url'
                }
            }
        }
    }
}
