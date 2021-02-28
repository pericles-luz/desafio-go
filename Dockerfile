FROM golang AS dev

WORKDIR /go/src

COPY . .

CMD [ "go", "run", "main.go" ]