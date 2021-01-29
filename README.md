# bigdata-on-kubernetes

## 1. Clone github repository

​		git clone https://github.com/Master-Specter/bigdata-on-kubernetes.git

## 2. Build component image

```
cd bigdata-on-kubernetes
sh build-image.sh
docker tag 
docker push
```

## 3. Run on kubernetes

```
kubectl create -f COMPONENT.yaml
```

