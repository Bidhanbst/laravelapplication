# Deploy Application
## First of all enable multi architecture docker build.
```
docker buildx create --use && docker buildx inspect —bootstrap

```

## Build the docker image using following command
```
docker buildx build --platform linux/amd64,linux/arm64 -t imagename:tag --push .

```

## Set up NFS server for Persistent Volume Storage
Follow the ansible [guide](https://github.com/Bidhanbst/ansible/blob/main/README.md) to create NFS server

## Under k8s/application folder apply the yaml for an application
```
kubectl apply -f deployment.yaml
kubectl apply -f horizontalpodautoscaler.yaml  
kubectl apply -f services.yaml

```

## Under k8s/database folder apply the yaml for a database
```
kubectl apply -f database-service.yaml
kubectl apply -f database.yaml 
kubectl apply -f persistentvolume.yaml 
kubectl apply -f persistentvolumeclaim.yaml
kubectl apply -f storage.yaml 

```