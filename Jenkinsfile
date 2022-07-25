pipeline {
	agent any
    stages {
        stage('build') {
            steps {
                echo "Running ${env.BUILD_ID} on ${env.JENKINS_URL}"
                checkout scm
                bat 'make' 
                archiveArtifacts artifacts: '**/target/*.jar', fingerprint: true 
            }
        }
        stage('Test') {
            steps {
                unstash 'app'
				bat 'make check || true'
            }
			post {
                always {
                    junit '**/target/*.xml'
                }
            }
		}
        stage('Deploy') {
            steps {
                timeout(time: 3, unit: 'MINUTES') {
					retry(5) {
						when {
							expression {
								currentBuild.result == null || currentBuild.result == 'SUCCESS' 
							}
						}
						steps {
							bat 'make publish'								
						}					
					}
                }
            }
        }
    }
    post {
        always {
            echo 'This will always run'
        }
        success {
            echo 'This will run only if successful'
        }
        failure {
            echo 'This will run only if failed'
        }
        unstable {
            echo 'This will run only if the run was marked as unstable'
        }
        changed {
            echo 'This will run only if the state of the Pipeline has changed'
            echo 'For example, if the Pipeline was previously failing but is now successful'
        }
    }
}