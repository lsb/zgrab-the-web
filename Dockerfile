FROM golang
RUN go get github.com/zmap/zgrab
WORKDIR /go/src/github.com/zmap/zgrab
RUN make
