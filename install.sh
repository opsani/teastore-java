#brew install istioctl
#istioctl install -y

kubectl create ns teastore
#kubectl label namespace teastore istio-injection=enabled --overwrite
kubectl kustomize java_opts | kubectl apply -n teastore -f -
kubectl apply -f loadgen2/loadgen2.yaml
