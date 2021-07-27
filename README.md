# e18n-toy

## Intro
e18n-toy is a toy project. The purpose of this project is
- to verify system networking in the k8s environment
- to test k8s cloud deployment
- to help decision making for the real externalization projects
- to help the team learn and adopt k8s

## Components
This project contains three parts
- `gateway` folder is a gateway server, which takes HTTP requests from the end-user to make gRPC requests to the gRPC server
- `grpc_server` folder is a gRPC backend server 
- `proto` contains the gRPC definition, and codes generated by protobuf compiler `protoc`

### Start Server in local 
### build
1. run `protoc --proto_path=./ --go_out=./ --go_opt=paths=source_relative  --go-grpc_out=. --go-grpc_opt=paths=source_relative proto/greeting.proto` to generate grpc stub code
2. goto the `grpc_server` folder, run
```
go mod download
go mod vendor
```
to download dependencies. Then run `go build  -mod vendor` to build.
3. goto the `gateway`, run the same command as step 2.

### run
1. run `./main` in both `gateway` and `grpc_server` folders
2. go to `http://localhost:8484/` to test


### Start Server in local k8s
### Preparation
1. Enable k8s in your docker. https://docs.docker.com/desktop/kubernetes/
2. install `kubectl` https://kubernetes.io/docs/tasks/tools/install-kubectl-macos/
### Build
1. run `build.sh` in both `gateway` and `grpc_server` folders

### Deploy Pods
1. run `kubectl apply -f deployment.yaml` in both `gateway` and `grpc_server` folders

### Define Service
1. run `kubectl apply -f service.yaml` in both `gateway` and `grpc_server` folders

### Port forward 
Since the k8s is running on a linux VM rather than on your local machine, you need to make a port forward in order to access.  Run `kubectl port-forward service/e13n-gateway-service 8484:8484`.

### Test 
Go to `http://localhost:8484/` to test


### Start Server in EKS
