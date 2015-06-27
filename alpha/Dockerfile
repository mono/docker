FROM debian:wheezy

MAINTAINER Jo Shields <jo.shields@xamarin.com>

#based on dockerfile by Michael Friis <friism@gmail.com>

RUN apt-get update \
    && apt-get install -y curl \
    && rm -rf /var/lib/apt/lists/*

RUN apt-key adv --keyserver pgp.mit.edu --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF

RUN echo "deb http://download.mono-project.com/repo/debian wheezy main" > /etc/apt/sources.list.d/mono-xamarin.list \
        && echo "deb http://download.mono-project.com/repo/debian alpha main" >> /etc/apt/sources.list.d/mono-xamarin.list \
	 && apt-get update \
	 && apt-get install --no-install-recommends -y mono-devel ca-certificates-mono fsharp mono-vbnc nuget \
	 && rm -rf /var/lib/apt/lists/*
