#brew install istioctl
#istioctl install -y

kubectl create ns teastore
#kubectl label namespace teastore istio-injection=enabled --overwrite
kubectl kustomize -f envoy | kubectl apply -f -
kubectl apply -f loadgen2/loadgen2.yaml
