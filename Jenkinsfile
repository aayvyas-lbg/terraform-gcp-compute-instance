pipeline {

    agent any 
    options {
        ansiColor('xterm')
    }

    stages {
        stage("intialize") {
            steps {
                script{
                    sh "terraform init"
                }
            }
        }
        stage("run tests"){
            steps { 
                script {
                    sh "terraform test"
                }
            }
        }
    }


}