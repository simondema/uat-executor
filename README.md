# UAT-Executor

This repo contains all the requirements to execute a test suite, using Insomnia CLI

- N.B. if exporting tests in JSON rather than YAML from Insomnia, modify the file pointer in the uat-runner.sh script.

## Steps for local testing

### Solution 1

#### 1. Build docker image

```bash
# 1. Move to container folder
cd container

# 2. Build image with tag
docker build -t uat-docker:<tag> .

# 3. Run container instance
docker run --env-file .env -d uat-docker:<tag>
```

### Solution 2

#### 1. Import docker image in Kubernetes cluster

```bash

# 1. Move to container folder
cd container

# 2. Build image with tag
docker build -t uat-docker:<tag> .

# 3. Save image tar on local machine
docker save uat-docker:<tag> -o uat-docker-<tag>.tar

# 4. Open a shell into kubernetes cluster (ONLY RANCHER DESKTOP)
rdctl shell

# 5. Load image into context
docker load -i <path_to_tar>/uat-docker-<tag>.tar

# 6. Apply configmap
kubectl apply -f ./template/configmap/config.yaml

# 7. Use kubectl to apply a pod or a scheduled cronjob

# 7.1 Cron
kubectl apply -f ./template/cronjob/cron.yaml

# 7.2 Single Pod
kubectl apply -f ./template/pod/pod.yaml

# 8. Delete resources
kubectl delete -f ./template/cronjob/cron.yaml --now
kubectl delete -f ./template/pod/pod.yaml --now
kubectl delete -f ./template/configmap/config.yaml --now
```