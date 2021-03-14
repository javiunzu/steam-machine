pipeline {
    agent any

    stages {
        stage('Build Packer') {
            steps {
                sh 'packer build .'
            }
        }
    }
}

