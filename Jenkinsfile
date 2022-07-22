pipeline {
    agent any
    triggers {
      cron 'H 0 * * *'
    }
    stages {
        stage('Hello') {
            steps {
                bat 'echo Hello World'
            }
        }
    }
}