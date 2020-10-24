pipeline {
    agent {
        docker {
            image 'jenkins/agent:latest'
        }
  }
  stages {

    stage('build'){
        steps{
            sh './install.sh' 
            sh 'docker-compose build'
        }
    }

    stage('test'){
        steps{
            sh 'docker-compose up -d'
        }
       
    }
   
    stage('verify'){ 
         steps{
             sh 'echo "verify build here."'
         }
       
    } 

    stage('version'){ 
        steps{
            sh 'echo "update version in git here."'
        }
       
    }

  }
}