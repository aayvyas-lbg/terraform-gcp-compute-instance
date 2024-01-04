pipeline {

    agent any 
    options {
        ansiColor('xterm')
    }
    parameters { 
        booleanParam(name: 'UNIT_TESTS', defaultValue: true, description: 'Run Unit tests') 
        booleanParam(name: 'INTEGRATION_TESTS', defaultValue: false, description: 'Run Integration Tests') 
    }
    stages {
        stage("intialize") {
            steps {
                script{
                    sh "terraform init"
                }
            }
        }
        stage("Unit Tests"){
            when { expression {params.UNIT_TESTS == true } }
            steps { 
                script {
                    sh "terraform test -filter=tests/unit-tests.tftest.hcl"
                }
            }
        }
        stage("Integration Tests"){
            when { expression {params.INTEGRATION_TESTS == true } }
            steps{
                sh "terraform test -filter=tests/integration.tftest.hcl"
            }   
        }
    }


}