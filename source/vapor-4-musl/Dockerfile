FROM ghcr.io/arasan01/swift:6.0.1-noble-musl-basic-linux-sdk

WORKDIR /code

COPY . .

RUN swift build -c release --swift-sdk aarch64-swift-linux-musl

CMD .build/release/main -e prod
