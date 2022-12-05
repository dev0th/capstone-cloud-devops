pipeline {
    agent any
    tools {
        maven "Maven3"
    }
    environment {
        registry = "310224694309.dkr.ecr.us-west-2.amazonaws.com/dev0th-docker-repo"
    }
    stages {
        stage('Checkout') {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/dev0th/capstone-cloud-devops']]])
            }
        }
        stage('Build Jar') {
            steps {
                sh 'mvn clean install'
            }
        }
        stage('Build Image') {
            steps {
                script {
                    docker.build registry 
                }
            }
        }
        stage('Push to ECR') {
            steps {
                sh "aws ecr get-login-password --region us-west-2 | docker login --username AWS --password-stdin 310224694309.dkr.ecr.us-west-2.amazonaws.com"
                sh "docker push 310224694309.dkr.ecr.us-west-2.amazonaws.com/dev0th-docker-repo:latest"
            }
        }
        stage('Deploy EKS') {
            steps {
                script {
                    withKubeConfig(caCertificate: '', clusterName: '', contextName: '', credentialsId: 'K8S', namespace: '', serverUrl: '') {
                        sh ('kubectl apply -f eks-deploy-k8s.yaml')
                    }
                }
            }
        }
    }
}
