pipeline {
    agent {
        docker {
            image 'docker/compose:latest'
        }
  }
  stages {

    stage('build'){
       sh './install.sh' 
       sh 'docker-compose build'
    }

    stage('test'){
       sh 'docker-compose up -d'
    }
   
    stage('verify'){ 
       sh 'echo "verify build here."'
    } 

    stage('version'){
       sh 'echo "update version in git here."'
    }

  }
}