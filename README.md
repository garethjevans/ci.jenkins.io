# ci.jenkins.io

A playground for playing with Jenkins Helm & JCasC

## Prereq

Install an ingress controller
```
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.2.1/deploy/static/provider/cloud/deploy.yaml
```

## build

```sh
$ make build
```

## deploy

```sh
$ make deploy
```

## test
The following tests are executed:
- test-connection
- test-login
- test-plugins

```sh
$ make test
```
