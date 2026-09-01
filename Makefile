dist: v86.tgz rv64.tgz wanix-linux-rv64.tgz
	mkdir -p dist
	cp v86.tgz rv64.tgz wanix-linux-rv64.tgz dist/
.PHONY: dist
