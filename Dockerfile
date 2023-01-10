ARG BUILD_FROM

FROM $BUILD_FROM

ARG BUILD_ARCH
ARG FRP_VERSION

ENV LANG C.UTF-8

# Copy data for add-on
COPY frpc.ini /usr/src
COPY bootstrap.sh /
COPY run.sh /

RUN chmod a+x /bootstrap.sh
RUN chmod a+x /run.sh

RUN /bootstrap.sh $BUILD_ARCH $FRP_VERSION

CMD [ "/run.sh"]