FROM registry.access.redhat.com/rhel7
USER 0

COPY yum.repos.d/* /etc/yum.repos.d/
COPY *.pem /var/lib/yum/

RUN yum -y install atomic

COPY nvidia-installer.sh /usr/local/bin/nvidia-installer.sh

CMD /usr/local/bin/nvidia-installer.sh
