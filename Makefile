.PHONY: init
init:
	go get -v -u golang.org/x/tools/cmd/goimports


## dep

.PHONY: redep
redep:
	rm -rf ./vendor
	make dep

.PHONY: dep
dep:
	go get -v -u github.com/golang/dep/cmd/dep
	dep ensure -v


## grpc

GRPC_GATEWAY_REPO=${GOPATH}/src/github.com/grpc-ecosystem/grpc-gateway/third_party/googleapis
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
	pb/${PROTO_NAME}.proto

.PHONY: protoc_gateway_go
protoc_gateway_go:
	protoc -I/usr/local/include -I. -I${GOPATH}/src \
	-I${GRPC_GATEWAY_REPO} \
	--grpc-gateway_out=logtostderr=true:. \
	pb/${PROTO_NAME}.gw.proto

.PHONY: downgrade_protoc # https://qiita.com/go_sagawa/items/5ba0ebb0cf42a629e2e9
downgrade_protoc:
	brew upgrade protobuf
	go get -v -u google.golang.org/grpc
	go get -v -u github.com/golang/protobuf/proto
	go get -v -u github.com/golang/protobuf/protoc-gen-go
	go get -v -u go.pedge.io/protoeasy/cmd/protoeasy
	go get -v -u github.com/grpc-ecosystem/grpc-gateway/protoc-gen-grpc-gateway
	go get -v -u github.com/grpc-ecosystem/grpc-gateway/protoc-gen-swagger

	cd ${GOPATH}/src/github.com/golang/protobuf/protoc-gen-go
	git checkout v1.2.0
	go install
	git checkout master

	cd ${GOPATH}/src/github.com/grpc-ecosystem/grpc-gateway/protoc-gen-grpc-gateway
	git checkout v1.5.1
	go install
	git checkout master