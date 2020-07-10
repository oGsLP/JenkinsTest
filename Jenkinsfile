pipeline {
    agent any
    environment{
        ENVV = "envv"
    }

    stages {
        stage('build') {
            steps {
                bat 'mvn --version'
            }
        }
        stage('test'){
            steps{
                sh 'echo "test "'
            }
        }
        stage('deploy'){
            steps{
                sh 'echo "deploy "'
            }
        }
    }
    post{
        always{
             echo "test ${ENVV}"
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