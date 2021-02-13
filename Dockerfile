# At the moment I don't know if a non root shell with no openSSH make sense, but here for deploying

FROM ubuntu:20.04

ADD https://github.com/tsl0922/ttyd/releases/download/1.6.3/ttyd.aarch64 /usr/bin/ttyd
RUN chmod +x /usr/bin/ttyd
ADD https://github.com/krallin/tini/releases/download/v0.19.0/tini-arm64 /sbin/tini
RUN chmod +x /sbin/tini

COPY setup_user_and_run.sh /root/setup_user_and_run.sh

EXPOSE 7681
WORKDIR /root

ENTRYPOINT ["/sbin/tini", "--"]
CMD ["bash", "/root/setup_user_and_run.sh"]
