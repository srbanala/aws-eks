pipeline {
    agent any
    environment {
        DOCKER_CREDS=credentials('docker_id')
        }
    stages {
      stage('Build'){
        steps {
         sh 'docker build -t anreddy/polls_eks_postgresql .'
              }
            }
      stage('Test'){
       steps{
        sh 'docker run -t anreddy/polls_sqlite python ./mysite/manage.py test run '
            }
           }

       stage('Deploy') {
         steps {
          sh ' curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl'
          sh ' chmod +x ./kubectl'
          sh ' mv ./kubectl /usr/local/bin/kubectl'
          sh 'aws eks update-kubeconfig --region ${AWS_DEFAULT_REGION} --name polls-cluster'
          sh 'kubectl get svc'
          sh 'kubectl get nodes'
            }
            }
    }
}