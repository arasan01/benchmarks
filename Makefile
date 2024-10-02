all: vapor-4-musl-mimalloc vapor-4-musl vapor-4
vapor-4-musl:
	docker build -t benchmark-vapor-4-musl source/vapor-4-musl
vapor-4-musl-mimalloc:
	docker build -t benchmark-vapor-4-musl-mimalloc source/vapor-4-musl-mimalloc
vapor-4:
	docker build -t benchmark-vapor-4 source/vapor-4

clean:
	docker stop $(docker ps -a -q)
	docker rm $(docker ps -a -q)
	docker images -a | grep "benchmark-" | awk '{print $3}' | xargs docker rmi
