FROM mono:3.12.0

MAINTAINER Jo Shields <jo.shields@xamarin.com>

RUN mkdir -p /usr/src/app/{source,build}
WORKDIR /usr/src/app/source

ONBUILD ADD . /usr/src/app/source
ONBUILD RUN nuget restore -NonInteractive
ONBUILD RUN xbuild /property:Configuration=Release /property:OutDir=/usr/src/app/build/
ONBUILD RUN rm -rf /usr/src/app/source
ONBUILD WORKDIR /usr/src/app/build
