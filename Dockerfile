FROM debian:stretch

RUN apt update

RUN apt install -y \
    build-essential \
    python3 \
    python3-dev \
    python3-pip \
    python3-pil \
    postgresql-client-9.6 \
    postgresql-server-dev-9.6 \
    libjpeg62-turbo \
    libjpeg62-turbo-dev \
    zlib1g-dev \
    liblcms2-dev \
    libfreetype6 \
    libfreetype6-dev \
    libffi-dev


ADD requirements.txt /
RUN pip3 install -r /requirements.txt

ENTRYPOINT ["/usr/local/bin/uwsgi"]
CMD ["--yaml", "uwsgi.yaml"]
