FROM mono:4.4.0.182

MAINTAINER Jo Shields <jo.shields@xamarin.com>

RUN mkdir -p /usr/src/app/source /usr/src/app/build
WORKDIR /usr/src/app/source

ONBUILD COPY . /usr/src/app/source
ONBUILD RUN nuget restore -NonInteractive
ONBUILD RUN xbuild /property:Configuration=Release /property:OutDir=/usr/src/app/build/
ONBUILD WORKDIR /usr/src/app/build
