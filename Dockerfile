FROM golang AS dev

WORKDIR /usr/src/hello
COPY main.go .
RUN go env -w GO111MODULE=off
RUN go build -ldflags "-s -w" -o hello

FROM scratch
WORKDIR /usr/src/hello
COPY --from=dev /usr/src/hello/hello .
CMD [ "./hello" ]