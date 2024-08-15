#!/bin/bash

# Teardown script for Kubernetes resources

echo "Tearing down Kubernetes resources..."

# Delete the pod
kubectl delete pod home-website
kubectl delete pod site2-website

# Delete the service
kubectl delete service home-nodeport-service
kubectl delete service site2-nodeport-service

# Delete the ingress
kubectl delete ingress home-ingress
kubectl delete ingress site2-ingress

echo "Teardown complete."
