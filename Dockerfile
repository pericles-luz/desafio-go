FROM golang AS dev

WORKDIR /usr/src/hello
COPY main.go .
RUN go env -w GO111MODULE=off
RUN go build -o hello

FROM alpine
WORKDIR /usr/src/hello
COPY --from=dev /usr/src/hello/hello .
CMD [ "./hello" ]