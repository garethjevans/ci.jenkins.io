pipeline {
  agent {
    kubernetes {
      label 'helmfile'
      yamlFile 'PodTemplates.yaml'
      inheritFrom 'jnlp-linux'
    }
  }

  options {
    buildDiscarder(logRotator(numToKeepStr: '10'))
    timeout(time: 30, unit: 'MINUTES')
    disableConcurrentBuilds()
  }

  stages {
    stage('Validate') {
      steps {
        //container('helmfile') {
        //  sh 'helmfile lint'
        //}
        container('yamllint') {
          sh 'yamllint --config-file yamllint.config helmfile.d config'
        }
      }
    }
//    stage('Plan') {
//      when { changeRequest() }
//      steps {
//        container('terraform') {
//          script {
//            plan = sh(returnStdout: true, script: 'terraform plan -no-color')
//            pullRequest.comment('```\n' + plan)
//          }
//        }
        // jnlp has a shell available
//        sh 'curl --silent --location --show-error --output tfsec https://github.com/tfsec/tfsec/releases/download/v0.36.9/tfsec-linux-amd64'
//        sh 'chmod a+x tfsec'
//        sh './tfsec'
//      }
//    }
  }
}
