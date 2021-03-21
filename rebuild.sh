#!/bin/sh
# docker build -t nginx_image .
# kubectl delete pods nginx
eval $(minikube docker-env)
minikube delete
minikube start --cpus 2
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/namespace.yaml #
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/metallb.yaml #
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)" #
docker build -t nginx-image .
kubectl apply -f srcs/nginx.yaml
kubectl describe pods nginx
kubectl get pods
minikube dashboard
