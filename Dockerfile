FROM ubuntu:20.04

ARG MSSQL_VERSION=2019
ARG APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE=1

RUN export DEBIAN_FRONTEND=noninteractive && \
    apt-get update && \
    apt-get install gnupg2 curl -yq && \
    apt-get upgrade -yq && \
    curl -s https://packages.microsoft.com/keys/microsoft.asc | apt-key add - && \
    curl -s https://packages.microsoft.com/config/ubuntu/20.04/mssql-server-${MSSQL_VERSION}.list | tee /etc/apt/sources.list.d/mssql-server-${MSSQL_VERSION}.list && \
    apt-get update

RUN apt install mssql-server mssql-server-fts -y
RUN apt-get clean

RUN /opt/mssql/bin/mssql-conf set sqlagent.enabled true && \
    /opt/mssql/bin/mssql-conf set sqlagent.startupwaitforalldb 0 && \
    /opt/mssql/bin/mssql-conf set telemetry.customerfeedback false && \
    /opt/mssql/bin/mssql-conf set network.forceencryption 1

USER mssql
CMD /opt/mssql/bin/sqlservr