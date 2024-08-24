module github.com/moethu/webg3n

require (
	github.com/g3n/engine v0.1.0
	github.com/gin-gonic/gin v1.7.0
	github.com/gorilla/websocket v1.4.2
	github.com/llgcode/draw2d v0.0.0-20200603164053-19660b984a28
	github.com/moethu/imaging v1.6.3
	github.com/pixiv/go-libjpeg v0.0.0-20190822045933-3da21a74767d
	github.com/satori/go.uuid v1.2.0
)

require (
	github.com/gin-contrib/sse v0.1.0 // indirect
	github.com/go-gl/glfw v0.0.0-20190409004039-e6da0acd62b1 // indirect
	github.com/go-playground/locales v0.13.0 // indirect
	github.com/go-playground/universal-translator v0.17.0 // indirect
	github.com/go-playground/validator/v10 v10.4.1 // indirect
	github.com/golang/freetype v0.0.0-20170609003504-e2365dfdc4a0 // indirect
	github.com/golang/protobuf v1.3.3 // indirect
	github.com/json-iterator/go v1.1.9 // indirect
	github.com/leodido/go-urn v1.2.0 // indirect
	github.com/mattn/go-isatty v0.0.12 // indirect
	github.com/modern-go/concurrent v0.0.0-20180306012644-bacd9c7ef1dd // indirect
	github.com/modern-go/reflect2 v1.0.1 // indirect
	github.com/ugorji/go/codec v1.1.7 // indirect
	golang.org/x/crypto v0.0.0-20200622213623-75b288015ac9 // indirect
	golang.org/x/image v0.0.0-20191009234506-e7c1f5e7dbb8 // indirect
	golang.org/x/sys v0.0.0-20200323222414-85ca7c5b95cd // indirect
	gopkg.in/yaml.v2 v2.2.8 // indirect
)

replace github.com/moethu/webg3n/renderer => ./renderer

replace github.com/moethu/webg3n/byteGraph => ./byteGraph

replace github.com/g3n/engine => github.com/moethu/engine v0.0.0-20200610122637-682e1e061a29

go 1.22.0
