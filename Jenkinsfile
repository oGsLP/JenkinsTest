pipeline {
    agent {
        docker {
            image 'maven:3-alpine'
            args '-v $HOME/.m2:/root/.m2'
        }
    }
    stages {

        //stage('Maven-install') {
        //    steps {
        //        sh 'mvn install'
        //   }
        //}
        stage('Maven-Build') {
            steps {
               // sh 'mvn package'
               sh 'mvn -B -DskipTests clean package'
            }
        }
        stage('Docker-build'){
            steps{
                sh 'sudo docker build -f Dockerfile -t java_hello_world:1.0.0 .'
            }
        }
        stage('Deploy'){
            steps{
                sh 'sudo docker run -d -p 8090:8090 java_hello_world:1.0.0'
            }
        }
    }
}