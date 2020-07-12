pipeline {
    agent none
    stages {

        //stage('Maven-install') {
        //    steps {
        //        sh 'mvn install'
        //   }
        //}
        stage('Maven-Build') {
            agent {
                    docker {
                        image 'maven:3-alpine'
                        args '-v $HOME/.m2:/root/.m2'
                    }
            }
            steps {
               // sh 'mvn package'
               sh 'mvn -B -DskipTests clean package'
            }
        }
        stage('Docker-build'){
            agent any
            steps{
                sh 'docker build -f Dockerfile -t java_hello_world:1.0.0 .'
            }
        }
        stage('Deploy'){
            agent any
            steps{
                sh 'docker run -d -p 8090:8090 java_hello_world:1.0.0'
            }
        }
    }
}