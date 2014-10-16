FROM debian:wheezy

#based on dockerfile by Michael Friis <friism@gmail.com>

RUN apt-get update \
	&& apt-get install -y curl
	&& rm -rf /var/lib/apt/lists/*

RUN curl http://download.mono-project.com/repo/xamarin.gpg | apt-key add -

RUN echo "deb http://download.mono-project.com/repo/debian wheezy main" > /etc/apt/sources.list.d/mono-xamarin.list \
	&& apt-get update \
	&& apt-get install -y mono-devel fsharp mono-vbnc nuget \
	&& rm -rf /var/lib/apt/lists/*

RUN mozroots --machine --import --sync --quiet

