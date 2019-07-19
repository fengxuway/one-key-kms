FROM registry.api.weibo.com/weiboad/centos:7.4.1708 as builder

RUN curl -sSL https://raw.githubusercontent.com/fengxuway/one-key-kms/master/one-key-kms-centos.sh -o one-key-kms-centos.sh \
    && bash one-key-kms-centos.sh

FROM registry.api.weibo.com/weiboad/centos:7.4.1708
COPY --from=builder /usr/local/kms/vlmcsd /usr/local/kms/vlmcsd
EXPOSE 1688

CMD ["/usr/local/kms/vlmcsd", "-L", "0.0.0.0:1688", "-l", "syslog", "-D"]
