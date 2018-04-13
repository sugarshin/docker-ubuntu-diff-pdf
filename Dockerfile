FROM ubuntu:14.04
MAINTAINER Shingo Sato <shinsugar@gmail.com>

RUN apt-get update
RUN apt-get install make automake g++
RUN apt-get install libpoppler-glib-dev poppler-utils wxgtk3.0-dev

WORKDIR /app
RUN git clone --depth=1 https://github.com/vslavik/diff-pdf.git

WORKDIR /app/diff-pdf

RUN ./bootstrap
RUN ./configure
RUN make
RUN make install

ENTRYPOINT ["/bin/sh"]
