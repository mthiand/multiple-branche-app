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
        stage('cat README') {
			when {
				branch "fix-*"
			}
            steps {
                bat '''
				  cat README
				'''
            }
        }
    }
}