#!/bin/bash

# Setup script for Kubernetes resources

echo "Setting up Kubernetes resources..."

# Apply the pod configuration
kubectl apply -f home/home-pod.yaml
kubectl apply -f site2/site2-pod.yaml

# Apply the service configuration
kubectl apply -f site2/site2-service.yaml
kubectl apply -f home/home-service.yaml

# Apply the ingress configuration
kubectl apply -f home/home-ingress.yaml
kubectl apply -f site2/site2-ingress.yaml

echo "Setup complete."

# Wait for pod to be ready
echo "Waiting for pod to be ready..."
kubectl wait --for=condition=ready pod/home-website --timeout=60s
kubectl wait --for=condition=ready pod/site2-website --timeout=60s

echo "All resources are up and running."