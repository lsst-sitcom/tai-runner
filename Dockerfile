FROM gcc:9 AS builder
WORKDIR /usr/src/tai
COPY ./get_taitime.c /usr/src/tai
RUN gcc -static -o get_taitime get_taitime.c

FROM centos:8
WORKDIR /usr/src/tai
COPY --from=builder /usr/src/tai/get_taitime .
COPY ./tai.sh .
CMD ["bash", "-c", "./tai.sh"]
