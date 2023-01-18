pipeline {
    agent any
    environment {
        DOCKERHUB_CREDENTIALS = credentials('dh-cred')
    }
    stages {
         stage('Checkout'){
            agent any
            steps{
                //Changez avec votre lien github
                git branch: 'master', url: 'https://github.com/mrezzdini/employeemanagerapp-master.git'
            }
        }
        stage('Init'){
            agent any
            steps{
            sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
            }
        }


         stage('Build frontend') {
            agent any

            steps {
                
                    sh 'docker build -t mrezzdini/empman:$BUILD_ID .'
                    sh 'docker push mrezzdini/empman:$BUILD_ID'
                    sh 'docker rmi mrezzdini/empman:$BUILD_ID'
                
            }
        }
        

        stage('Logout'){
            agent any
            steps{
                sh 'docker logout'
            }
        }
    }
}
