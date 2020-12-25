# Kubernetes Custom Controller - Custom Resource Handling

**Note**: the source code is _verbosely_ commented, so the source is meant to be read and to teach

## What is this?

An example of a custom Kubernetes controller that's only purpose is to watch for the creation, updating, or deletion of all custom resource of type `Network` (in the all namespaces). This was created as an exercise to understand how Kubernetes controllers work and interact with the cluster and resources.

## Running

Clone repo:

```
$ git clone https://github.com/seecsea/k8s-crd-samp
$ cd k8s-controller-custom-resource
```

Prepare build environment:

```
$ go get github.com/tools/godep
$ godep restore
```

Build and run:

```
$ go build -o samplecrd-controller .
$ ./samplecrd-controller -kubeconfig=$HOME/.kube/config -alsologtostderr=true
```

You can also use `samplecrd-controller` to create a Deployment and run it in Kubernetes. Note in this case, you don't need to specify `-kubeconfig` in CMD as default `InClusterConfig` will be used.

## Usage

You should create the CRD of Network first:

```
$ kubectl apply -f crd/network.yaml
```

You can then trigger an event by creating a Network API instance:

```
$ kubectl apply -f example/example-network.yaml
```

CURD the Network API instance, and check the logs of controller. 

Enjoy!

## 新版本依赖处理说明
1、删除了原来的Godeps目录，改为go.mod管理依赖  
2、https://v1-16.docs.kubernetes.io/docs/setup/release/notes/里废弃了DirectCodecFactory，所以有几种选择：  
... a、使用不高于1.16.0的client-go版本，比如：v0.15.12，代码完全不用改  
... b、使用v0.17.0的client-go，使用上述文档里的替代方法：serializer.WithoutConversionCodecFactory  
... c、如果升级到更新的开发环境比如v0.18.8的client-go，则有几个函数里要添加context.TODO(),  
