FROM centos:8
MAINTAINER raoul@bhatia.at
# No dmidecode, as not required for remote access
RUN yum update -y && yum install -y wget perl openssl-devel
RUN wget -q -O - http://linux.dell.com/repo/hardware/latest/bootstrap.cgi | bash

RUN yum install -y srvadmin-idracadm7

# Clean up caches
RUN yum -y clean all && rm -rf /var/cache

ENV PATH "$PATH:/opt/dell/srvadmin/bin/"
ENTRYPOINT ["/opt/dell/srvadmin/bin/idracadm7"]
