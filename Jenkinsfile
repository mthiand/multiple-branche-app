pipeline {
    agent {
        docker { image 'node:16.13.1-alpine' }
    }
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
		Type README
		'''
            }
        }
    }
    stage('Test') {
        steps {
            sh 'node --version'
        }
    }
}
