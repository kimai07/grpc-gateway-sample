# grpc-gateway-sample

- pb.goファイル作成

```sh
$ make protoc_go
$ make protoc_gateway_go
```

- server起動

```sh
$ go run server/main.go
```

- gateway起動

```sh
$ go run gateway/main.go
```

- リクエスト確認

```
$ curl -d '{"name":"KJ"}' -X POST 'http://localhost:8080/greeter/hello'
{"msg":"Hello KJ"}
```


