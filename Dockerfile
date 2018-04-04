FROM debian:stretch

RUN apt-get update

RUN apt-get install -y \
    build-essential \
    python \
    python-dev \
    python-pip \
    postgresql-client-9.6 \
    postgresql-server-dev-9.6 \
    libjpeg62-turbo \
    libjpeg62-turbo-dev \
    zlib1g-dev \
    liblcms2-dev \
    libfreetype6 \
    libfreetype6-dev \
    python-imaging \
    libffi-dev

    #liblcms1 \
    #liblcms1-dev \
    #libjpeg8 \
    #libjpeg8-dev \


ADD requirements.txt /
RUN pip install --index-url=https://pypi.python.org/simple/ -r /requirements.txt

ENTRYPOINT ["/usr/local/bin/uwsgi"]
CMD ["--yaml", "uwsgi.yaml"]
