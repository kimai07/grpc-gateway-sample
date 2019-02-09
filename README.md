# grpc-gateway-sample

- https://github.com/grpc-ecosystem/grpc-gateway

![](https://camo.githubusercontent.com/e75a8b46b078a3c1df0ed9966a16c24add9ccb83/68747470733a2f2f646f63732e676f6f676c652e636f6d2f64726177696e67732f642f3132687034435071724e5046686174744c5f63496f4a707446766c41716d35774c513067677149356d6b43672f7075623f773d37343926683d333730)

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


