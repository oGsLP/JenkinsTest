pipeline {
    agent {
        docker {
            image 'maven:3-alpine'
            args '-v $HOME/.m2:/root/.m2'
        }
    }
    stages {

        stage('Maven-install') {
            steps {
                bat 'mvn install'
            }
        }
        stage('Maven-Build') {
            steps {
                bat 'mvn package'
            }
        }
        stage('Docker-build'){
            steps{
                bat 'docker build -f Dockerfile -t java_hello_world:1.0.0 .'
            }
        }
        stage('Deploy'){
            steps{
                bat 'docker run -d -p 8090:8090 java_hello_world:1.0.0'
            }
        }
    }
}