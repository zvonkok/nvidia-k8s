ERNAME := zvonkok
REPO := redhat
VERSION := 384.81
KERNEL := $(shell uname -r)

all: 
	docker build -t $(USERNAME)/$(REPO)\:nvidia-daemonset-$(VERSION)
	docker tag $(USERNAME)/$(REPO)\:nvidia-daemonset-$(VERSION) docker.io/$(USERNAME)/$(REPO)\:nvidia-daemonset-$(VERSION)


