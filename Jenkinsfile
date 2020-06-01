pipeline {
    agent { dockerfile true }
    environment { 
        CI = 'true'
        
        CHROME_BIN= "/usr/bin/google-chrome"
        NO_PROXY = "localhost, 0.0.0.0/4201, 0.0.0.0/9876"
      //ALL STAGES:
      BUILD = 'false'
      TEST = 'false'
      DELIVER = 'true'
    }
    stages {
        stage('Build') {
            when {
              environment name: 'BUILD', value: 'true' 
            }
            steps {
                
                sh 'npm i --loglevel silent'
                sh 'npm cache clean --force'
                sh 'npm install --save core-js@^3'
                sh 'npm update [-g] [chokidar]'
                sh 'npm install gulp-sass --save-dev'
                sh 'npm install node-sass@latest'
                
                sh 'npm i -s'
              
                sh 'npm install karma-chrome-launcher --save-dev'
                sh 'npm i --save-dev puppeteer'
              
                
            }
        }
        stage('Test') {
            when {
              environment name: 'TEST', value: 'true' 
            }
            steps {
              sh "chmod +x ./jenkins/scripts/test.sh"
              sh './jenkins/scripts/test.sh'
            }
        }
        stage('Deliver') { 
            when {
              environment name: 'DELIVER', value: 'true' 
            }
            steps {
                sh 'ls'
                sh 'yum install httpd'
                //sh "chmod +x ./jenkins/scripts/deliver.sh"
                //sh './jenkins/scripts/deliver.sh'
                input message: 'Finished using the web site? (Click "Proceed" to continue)' 
                //sh "chmod +x ./jenkins/scripts/kill.sh"
                //sh './jenkins/scripts/kill.sh'
            }
        }
    }
}
