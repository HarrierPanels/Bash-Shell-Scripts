pipeline {
  agent {label 'linux'}
  stages {
    stage('Build') {
      steps {
        sh """
	 jenkins --version
	 git --version
	 php --version
	""" 
      }
    }
  }
}
