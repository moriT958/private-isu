.PHONY: init dev down bench
init: webapp/sql/dump.sql.bz2 benchmarker/userdata/img

webapp/sql/dump.sql.bz2:
	cd webapp/sql && \
	curl -L -O https://github.com/catatsuy/private-isu/releases/download/img/dump.sql.bz2

benchmarker/userdata/img.zip:
	cd benchmarker/userdata && \
	curl -L -O https://github.com/catatsuy/private-isu/releases/download/img/img.zip

benchmarker/userdata/img: benchmarker/userdata/img.zip
	cd benchmarker/userdata && \
	unzip -qq -o img.zip

dev:
	cd webapp && docker compose up -d

down:
	cd webapp && docker compose down

bench:
	docker build -t private-isu-benchmarker benchmarker
	docker run --rm --network private-isu_my_network private-isu-benchmarker /bin/benchmarker -t http://nginx -u /opt/userdata
