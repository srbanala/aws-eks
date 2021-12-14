node {
  def image
    stage ('checkout'){
       checkout([$class: 'GitSCM', branches: [[name: '*/main']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[credentialsId: '', url: 'https://github.com/srbanala/aws-eks.git']]])
          }
         }
    stage('Docker Build'){
          docker.build('polls')
             }
    stage ('K8S Deploy'){
           sh 'kubectl apply -f k8s'
      }
     }
