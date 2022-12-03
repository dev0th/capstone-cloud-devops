# Deploy Springboot App using Jenkins Pipeline, Amazon ECR and Amazon EKS

<div align="left">
    <img src="screenshots/[RM01]PROJECT_DIAGRAM.png" />
</div>

## Project Overview

The goal of the project is to apply the skills and knowledge which were developed throughout the Cloud DevOps program. These include:
* Working in AWS
* Using Jenkins to implement Continuous Integration and Continuous Deployment
* Building pipelines
* Working with CloudFormation to deploy clusters
* Building Kubernetes clusters
* Building Docker containers in pipelines

## Prerequisites

To run and test the deployment locally, make sure that you have the following tools installed on your machine:
* Java
* Maven
* Docker
* kubectl
* Minikube

To deploy the application to Amazon EKS you also need the following tools:
* AWS CLI
* eksctl

## File Explanation

<div align="left">
    <img src="screenshots/[RM02]FILE_EXPLANATION.png" />
</div>

- `Dockerfile`: text file that contains set of instructions for docker to automatically build an image for the app to be run in a container
- `Jenkinsfile`: text file that contains the Jenkins Pipeline configurations
- `deployment/config.yml`: file that stores dictionary of configuration settings for the application
- `deployment/deployment.yml`: file with declarative updates to application that is deployed to kubernetes cluster
- `deployment/secret.yml`: file that stores and manages sensitive information for the application, such as tokens, keys and passwords
- `deployment/service.yml`: file that defines service to be deployed to kubernetes cluster
- `run_docker.sh`: script file to build an image from Dockerfile and run a docker container locally
- `run_kubernetes:sh`: script file to run on Kubernetes locally with minikube
- `upload_docker.sh`: script file to tag a local docker image and push it to docker hub

## How to Run

### Run application standalone

* Build and run
    ``` bash
    mvn clean spring-boot:run
    ```
* Access running application at http://localhost:8080

### Run application in Docker

* Build docker image and run
    ``` bash
    ./run_docker.sh
    ```
* Access running application at http://localhost:8080
* Upload your docker image to DockerHub by running
    ``` bash
    ./upload_docker.sh
    ```
  Substitute the dockerPath with the path to your DockerHub repository

### Run application in Kubernetes with minikube

* Make sure, you have uploaded your docker image to DockerHub by running
    ``` bash
    ./upload_docker.sh
    ```
* Run
    ``` bash
    ./run_kubernetes.sh
    ```
  to deploy the application to minikube cluster
### Run application in Amazon Elastic Kubernetes Service (EKS)

To create and manage the Kubernetes cluster, it's convenient to use eksctl CLI tool. It uses AWS CloudFormation to provision and configure resources for Amazon EKS clusters and node groups. Make sure, you installed kubectl and eksctl on your machine and configured IAM permissions for your user to work with Amazon EKS. Then, run the following command:
``` bash
./create_eks_cluster.sh
```

#### Setup Jenkins Server
* Create EC2 instance with Ubuntu Server 18.04/20.04 LTS. Make sure that SSH port 22 and Jenkins port 8080 are open for access
* On your EC2 instance, install Java 8/Java 11 and verify your installation
    ``` bash
    sudo apt-get update
    sudo apt-get install openjdk-8-jdk
    java --version
    ```
