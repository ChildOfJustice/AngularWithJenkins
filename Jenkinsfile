
pipeline {
    agent {
         docker {
            image 'node:latest' 
            args '-p 3000:3000 --privileged' 
        }
    }
    environment { 
        CI = 'true'
    }
    stages {
        stage('Build') {
            steps {
                
                sh 'npm i --loglevel silent'
                sh 'npm cache clean --force'
                sh 'npm install --save core-js@^3'
                sh 'npm update [-g] [chokidar]'
                sh 'npm install gulp-sass --save-dev'
                sh 'npm install node-sass@latest'
                
                sh 'npm i -s'
              
                sh 'npm install karma-firefox-launcher --save-dev'
                sh 'npm install karma-chrome-launcher --save-dev'
                sh 'npm install --save-dev karma-phantomjs-launcher'
                sh 'karma start --browsers PhantomJS_custom'
              
                sh 'npm run cibuild'
            }
        }
        stage('Test') {
            steps {
                sh './jenkins/scripts/test.sh'
            }
        }
        stage('Deliver') { 
            steps {
                sh './jenkins/scripts/deliver.sh' 
                input message: 'Finished using the web site? (Click "Proceed" to continue)' 
                sh './jenkins/scripts/kill.sh' 
            }
        }
    }
}
