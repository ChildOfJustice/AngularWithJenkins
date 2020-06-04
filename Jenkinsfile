pipeline {
    agent none
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
        stage('Build and Test in docker') {
            agent { dockerfile true }
            stages{
                stage('Build'){
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

                    sh 'npm run build'
                  }
                }
                stage('Test') {
                  when {
                    environment name: 'TEST', value: 'true' 
                  }
                  steps {
                    sh 'sudo apt install -y gconf-service libasound2 libatk1.0-0 libc6 libcairo2 libcups2 libdbus-1-3 libexpat1 libfontconfig1 libgcc1 libgconf-2-4 libgdk-pixbuf2.0-0 libglib2.0-0 libgtk-3-0 libnspr4 libpango-1.0-0 libpangocairo-1.0-0 libstdc++6 libx11-6 libx11-xcb1 libxcb1 libxcomposite1 libxcursor1 libxdamage1 libxext6 libxfixes3 libxi6 libxrandr2 libxrender1 libxss1 libxtst6 ca-certificates fonts-liberation libappindicator1 libnss3 lsb-release xdg-utils wget'
                    sh "chmod +x ./jenkins/scripts/test.sh"
                    sh './jenkins/scripts/test.sh'
                  }
                }
            }
        }
        
        stage('Deliver') { 
            agent any
            when {
              environment name: 'DELIVER', value: 'true' 
            }
            steps {
                //sh 'ls'
                //sh 'sudo apt-get install apache2 -y'
                sh "chmod +x ./jenkins/scripts/deliver.sh"
                sh './jenkins/scripts/deliver.sh'
                //input message: 'Finished using the web site? (Click "Proceed" to continue)' 
                //sh "chmod +x ./jenkins/scripts/kill.sh"
                //sh './jenkins/scripts/kill.sh'
            }
        }
    }
}

