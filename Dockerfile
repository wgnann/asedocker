FROM debian
RUN apt-get update && apt-get -y install libaio1 unzip
ADD ASE_Suite.linuxamd64.tgz /root/ASE
COPY response /root/ASE
RUN mkdir -p /opt/sybase/log
RUN /root/ASE/setup.bin -f /root/ASE/response -i silent -DAGREE_TO_SAP_LICENSE=true
COPY interfaces /opt/sybase/sap/interfaces
COPY sybase.sh /opt/sybase
EXPOSE 5000
ENTRYPOINT ["/opt/sybase/sybase.sh"]