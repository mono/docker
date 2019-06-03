# Maven's custom Dockerfile to build mono on bionic with latest OS updates

- To build mono v6 preview
```
    git clone git@github.com:themaven-net/docker-mono.git
    cd docker-mono/maven/
    docker build -t "<<TAG>>" -f Dockerfile.bionic-mono-v6-preview-2019060301 .
```
# Supported tags and `Dockerfile` links

This image provides Docker releases of the [Mono Project](http://www.mono-project.com/).

## Supported tags and versions

We push every Mono release to Docker Hub. The latest version, one minor version before that and the last version
before a major version bump are periodically rebuilt by Docker Hub to pull in updates from
the base Debian image.

All other version tags are still available, but won't get those updates
so you need to keep your images up to date by running `apt-get update` yourself. We encourage you to move
to latest Mono releases as soon as they're available.

Starting with Mono 5.2 we provide a `slim` variant which only contains the bare minimum to run a simple console app. You can use this as a base and add just what you need.

## How to use this image

This image can be used to run stand-alone Mono console apps or build your projects in a container.

```
FROM mono:latest

RUN mono --version
RUN msbuild MySolution.sln
RUN mono MyConsoleApp.exe
```

## Credits

This Docker image is provided by Xamarin/Microsoft, for users of the Mono Project.

Thanks to [Michael Friis](http://friism.com/) for his preliminary work.

## Issues

Please report issues on the [GitHub project](https://github.com/mono/docker/issues).

## License

This Docker Image is licensed with the Expat License. See the [Mono Project licensing FAQ](http://www.mono-project.com/docs/faq/licensing/) for details on how Mono and associated libraries are licensed.
