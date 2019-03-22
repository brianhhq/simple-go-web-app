From golang:1.12.1-alpine3.9
WORKDIR /app
ADD main.go .
CMD ["go", "run", "main.go"]
