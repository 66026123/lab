pipeline {
    agent any

    environment {
        STUDENT_ID = "66026123"  // 🔹 ใส่รหัสนิสิตของคุณที่นี่
        DOCKER_IMAGE = "66026123/lab-app"
        DOCKER_SERVER = "43.208.241.236"
        PORT = "3000"  // 🔹 เปลี่ยนเป็นพอร์ตระหว่าง 1000-5000
    }

    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'main', url: 'https://github.com/66026123/lab.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh "docker build -t $DOCKER_IMAGE --build-arg STUDENT_ID=${STUDENT_ID} ."
                }
            }
        }

        stage('Push to Docker Hub') {
            steps {
                script {
                    sh "docker login -u your_dockerhub_username -p your_dockerhub_password"
                    sh "docker tag $DOCKER_IMAGE your_dockerhub_username/$DOCKER_IMAGE"
                    sh "docker push your_dockerhub_username/$DOCKER_IMAGE"
                }
            }
        }

        stage('Deploy on Docker Server') {
            steps {
                script {
                    sh "ssh ubuntu@$DOCKER_SERVER 'docker pull your_dockerhub_username/$DOCKER_IMAGE'"
                    sh "ssh ubuntu@$DOCKER_SERVER 'docker stop ${STUDENT_ID}_app || true'"
                    sh "ssh ubuntu@$DOCKER_SERVER 'docker rm ${STUDENT_ID}_app || true'"
                    sh "ssh ubuntu@$DOCKER_SERVER 'docker run -d -p ${PORT}:3000 --name ${STUDENT_ID}_app your_dockerhub_username/$DOCKER_IMAGE'"
                }
            }
        }
    }

    post {
        success {
            echo "✅ Deployment Successful on port ${PORT}"
        }
        failure {
            echo "❌ Deployment Failed"
        }
    }
}


