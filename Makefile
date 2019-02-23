default: build

build:
	set -e
	rm -rf lambda_edge/output
	mkdir -p lambda_edge/output
	cp lambda_edge/src/index.js lambda_edge/output
	cd lambda_edge/output && zip -r9 ../output.zip ./*

.PHONEY: build
