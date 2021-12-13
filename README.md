# Deploy Descartes Research TeaStore with Opsani Envoy and JAVA Env options

create a teastore namespace and set your kubernetes environment to point to it (`kubens` is very effective for this)

```sh
kubectl create ns teastore
kubens teastore
kubectl apply -k java_opts -n teastore
```

Wait for the teastore app to get started, and build out it's database.  This is a good time
to deploy Opsani (though with no load, servo may cycle for a while).

replace the service, deployment, and container names with `teastore-webui` in the manifest and the namespace with teastore.

Then apply opsani-manifest

```sh
kubectl apply -f opsani_manifests.yaml -n teastore
```

And finally start some load, there are two load generators (and a load profile for one of them that can be read only, or read/write against the database).  I recommend the second loadgenerator (loadgen2) based on JMeter for simplicity, and for it's ability to run continuously.  loadgen has a .csv that needs to cover the expected load for every second, and is set to run for 24 hours and then stop.

```sh
kubectl apply -f loadgen2/loadgen2.yaml -n teastore
```



