FROM debian:wheezy

RUN apt-get update

RUN apt-get install -y \ 
    build-essential \
    python \
    python-dev \
    python-pip \
    postgresql-client-9.1 \
    postgresql-server-dev-9.1 \
    libjpeg8 \
    libjpeg8-dev \
    zlib1g-dev \
    libfreetype6 \
    libfreetype6-dev \
    liblcms1 \
    liblcms1-dev \
    python-imaging \
    libffi-dev

ADD requirements.txt /
RUN pip install -r /requirements.txt

ENTRYPOINT ["/usr/local/bin/uwsgi"]
CMD ["--yaml", "uwsgi.yaml"]
