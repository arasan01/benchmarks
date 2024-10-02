IP=localhost

benchmark_do() {
    NAME=$1
    ID=$2

    echo "📊  $NAME"
    CID=`docker run -d -p 9000:9000 benchmark-$ID`
    echo "Booting..."
    sleep 2

    echo "📝  Testing GET /ping"
    TEST=`curl --verbose http://$IP:9000/ping 2>&1`
    if [[ $TEST != *"pong"* ]]; then
        echo "⚠️  pong not detected"
    fi
    if [[ $TEST != *"text/plain; charset=utf-8"* ]]; then
        echo "⚠️  incorrect content-type"
    fi
    if [[ $TEST != *"HTTP/1.1 200 OK"* ]]; then
        echo "⚠️  incorrect status"
    fi
    if [[ $TEST != *"ength: 4"* ]]; then
        echo "⚠️  incorrect length"
    fi
    if [[ $TEST != *"ate: "* ]]; then
        echo "⚠️  no date header"
    fi

    echo "🚀  Benchmarking"
    wrk -t 4 -c 128 -d 5 http://$IP:9000/ping

    docker stop $CID

    echo ""
}

benchmark_do "Vapor 4 (Swift)" vapor-4
benchmark_do "Vapor 4 Musl (Swift)" vapor-4-musl
benchmark_do "Vapor 4 Musl + mimalloc(Swift)" vapor-4-musl-mimalloc

echo "✅  Done"
