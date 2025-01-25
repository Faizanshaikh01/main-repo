pipeline {
    agent any
    
    stages {
        stage('Checkout Git Repo') {
            steps {
                git branch: 'main',
                    credentialsId: 'faizan0',
                    url: 'https://github.com/Faizanshaikh01/main-repo.git'
            }
        }
        
        stage('Remove Old Image') {
            steps {
                sh "docker system prune --all -f"
            }
        }
        
        stage('Build New Image') {
            steps {
                sh "docker build -t shaikhfaizan0/myhub:mynginx ."
            }
        }
        
         stage('run command docker images') {
            steps {
                sh "docker images"
            }
        }
        
        stage('Docker Credential') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'myhub', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
                    sh "echo ${DOCKER_PASS} | docker login -u ${DOCKER_USER} --password-stdin"
                }
            }
        }
        
        stage('Push Image to Docker Hub') {
            steps {
                sh "docker push shaikhfaizan0/myhub:mynginx"
            }
        }
    }
}
