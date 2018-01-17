USERNAME := zvonkok
REPO := redhat
VERSION := 384.81
KERNEL := $(shell uname -r)

all: 
	cp -r /etc/yum.repos.d/ .
	cp /var/lib/yum/*.pem .
	docker build -t $(USERNAME)/$(REPO)\:nvidia-daemonset-$(VERSION) .
	docker tag $(USERNAME)/$(REPO)\:nvidia-daemonset-$(VERSION) docker.io/$(USERNAME)/$(REPO)\:nvidia-daemonset-$(VERSION)

push:
	docker push docker.io/$(USERNAME)/$(REPO)\:nvidia-daemonset-$(VERSION)
