FROM mono:3.8.0

RUN mkdir -p /usr/src/app/{source,build}
WORKDIR /usr/src/app/source

ONBUILD ADD . /usr/src/app/source
ONBUILD RUN nuget restore -NonInteractive
ONBUILD RUN xbuild /property:Configuration=Release /property:OutDir=/usr/src/app/build/
ONBUILD RUN rm -rf /usr/src/app/source
ONBUILD WORKDIR /usr/src/app/build
