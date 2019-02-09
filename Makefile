GRPC_GATEWAY_REPO=github.com/grpc-ecosystem/grpc-gateway/third_party/googleapis
PROTO_NAME=hello

.PHONY: init_grpc
init_grpc:
	go get -v -u github.com/golang/protobuf/protoc-gen-go
	go get -v -u github.com/grpc-ecosystem/grpc-gateway/protoc-gen-grpc-gateway


.PHONY: protoc_go
protoc_go:
	protoc -I. \
	-I${GRPC_GATEWAY_REPO} \
	--go_out=plugins=grpc:. \
	pb/${PROTO_NAME}.gw.proto

.PHONY: protoc_gateway_go
protoc_gateway_go:
	protoc -I/usr/local/include -I. -I${GOPATH}/src \
	-I${GRPC_GATEWAY_REPO} \
	--grpc-gateway_out=logtostderr=true:. \
	pb/${PROTO_NAME}.gw.proto