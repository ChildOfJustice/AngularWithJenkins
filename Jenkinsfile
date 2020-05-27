
pipeline {
    agent {
         docker {
            image 'node:latest' 
            args '-p 3000:3000' 
        }
    }
    environment { 
        CI = 'true'
    }
    stages {
        stage('Build') {
            steps {
                sh 'apt-get update'
                sh 'apt-get -y install sudo'
                sh 'wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb'
                sh 'sudo dpkg -i --force-depends google-chrome-stable_current_amd64.deb'
                sh 'npm i --loglevel silent'
                sh 'npm cache clean --force'
                sh 'npm install --save core-js@^3'
                sh 'npm update [-g] [chokidar]'
                sh 'npm install gulp-sass --save-dev'
                sh 'npm install node-sass@latest'
                
                sh 'npm i -s'
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
