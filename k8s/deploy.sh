kubectl apply -f k8s
kubectl set image deployments/polls-deployment polls-container=anreddy/django-polls:$SHA
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.0.4/deploy/static/provider/aws/deploy.yaml
