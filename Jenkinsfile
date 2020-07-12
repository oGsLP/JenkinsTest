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
                sh 'mvn install'
            }
        }
        stage('Maven-Build') {
            steps {
                sh 'mvn package'
            }
        }
        stage('Docker-build'){
            steps{
                sh 'docker build -f Dockerfile -t java_hello_world:1.0.0 .'
            }
        }
        stage('Deploy'){
            steps{
                sh 'docker run -d -p 8090:8090 java_hello_world:1.0.0'
            }
        }
    }

    post{
        always{
             echo "test"
        }
        success {
             echo 'This will run only if successful'
        }
        failure {
            echo 'This will run only if failed'
        }
        unstable {
            echo 'This will run only if the run was marked as unstable'
        }
        changed {
            echo 'This will run only if the state of the Pipeline has changed'
            echo 'For example, if the Pipeline was previously failing but is now successful'
        }
    }
}