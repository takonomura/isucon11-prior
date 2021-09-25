FROM golang:1.17 AS build

WORKDIR /webapp

COPY go.mod go.sum ./
RUN go mod download

COPY *.go ./
RUN CGO_ENABLED=0 go build -o webapp .

FROM scratch

WORKDIR /webapp

COPY --from=build /webapp/webapp ./webapp
COPY public /public

ENTRYPOINT ["/webapp/webapp"]
