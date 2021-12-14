pipeline {
    agent any
    environment {
        DOCKER_CREDS=credentials('docker_id')
        AWS_DEFAULT_REGION='us-east-1'
        AWS_ACCESS_KEY_ID=credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY=credentials('AWS_SECRET_ACCESS_KEY')
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
          sh 'curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl'
          sh 'chmod +x ./kubectl'
          sh 'sudo mv ./kubectl /usr/local/bin/kubectl'
          sh 'export AWS_ACCESS_KEY_ID=${AWS_ACCESS_KEY_ID_PSW}'
          sh 'export AWS_SECRET_ACCESS_KEY=${AWS_SECRET_ACCESS_KEY_PSW}'
          sh 'export AWS_DEFAULT_REGION=us-east-1'
          sh 'aws eks update-kubeconfig  --name polls-cluster'
          sh 'kubectl apply -f k8s'
          sh 'kubectl get svc'
          sh 'kubectl get nodes'
            }
            }
    }
}

