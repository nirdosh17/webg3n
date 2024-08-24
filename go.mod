module github.com/moethu/webg3n

require (
	github.com/g3n/engine v0.1.0
	github.com/gin-gonic/gin v1.7.0
	github.com/gorilla/websocket v1.4.2
	github.com/llgcode/draw2d v0.0.0-20200603164053-19660b984a28
	github.com/modern-go/concurrent v0.0.0-20180306012644-bacd9c7ef1dd // indirect
	github.com/modern-go/reflect2 v1.0.1 // indirect
	github.com/moethu/imaging v1.6.3
	github.com/pixiv/go-libjpeg v0.0.0-20190822045933-3da21a74767d
	github.com/satori/go.uuid v1.2.0
	golang.org/x/sys v0.0.0-20200323222414-85ca7c5b95cd // indirect
)

replace github.com/moethu/webg3n/renderer => ./renderer

replace github.com/moethu/webg3n/byteGraph => ./byteGraph

replace github.com/g3n/engine => github.com/moethu/engine v0.0.0-20200610122637-682e1e061a29

go 1.13
