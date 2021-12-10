brew install istioctl
istioctl install -y

kubectl create ns teastore
#kubectl label namespace teastore istio-injection=enabled --overwrite
kubectl apply -f iks-teastore.yaml
kubectl apply -f loadgen/*.yaml
