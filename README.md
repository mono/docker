# Supported tags and `Dockerfile` links

- [`latest` (*Dockerfile*)](https://github.com/mono/docker/blob/master/5.0.0.100/Dockerfile)
- [`5.0.0.100` (*Dockerfile*)](https://github.com/mono/docker/blob/master/5.0.0.100/Dockerfile)
- [`5.0.0` (*Dockerfile*)](https://github.com/mono/docker/blob/master/5.0.0.100/Dockerfile)
- [`5.0` (*Dockerfile*)](https://github.com/mono/docker/blob/master/5.0.0.100/Dockerfile)
- [`5` (*Dockerfile*)](https://github.com/mono/docker/blob/master/5.0.0.100/Dockerfile)
- [`4.8.0.524` (*Dockerfile*)](https://github.com/mono/docker/blob/master/4.8.0.524/Dockerfile)
- [`4.8.0` (*Dockerfile*)](https://github.com/mono/docker/blob/master/4.8.0.524/Dockerfile)
- [`4.8` (*Dockerfile*)](https://github.com/mono/docker/blob/master/4.8.0.524/Dockerfile)
- [`4` (*Dockerfile*)](https://github.com/mono/docker/blob/master/4.8.0.524/Dockerfile)
- [`3.12.1` (*Dockerfile*)](https://github.com/mono/docker/blob/master/3.12.1/Dockerfile)
- [`3.12` (*Dockerfile*)](https://github.com/mono/docker/blob/master/3.12.1/Dockerfile)
- [`3` (*Dockerfile*)](https://github.com/mono/docker/blob/master/3.12.1/Dockerfile)

*Note:* We push every Mono release to Docker Hub. The latest, latest-1 and the last version
before a major version bump are periodically rebuilt by Docker Hub to pull in updates from
the base Debian image. All other version tags are still available, but won't get those updates
so you need to keep your images up to date by running `apt` yourself. We encourage you to move
to latest Mono releases as soon as they're available.

# What is Mono

Sponsored by Xamarin, Mono is an open source implementation of Microsoft's .NET Framework based on the ECMA standards for C# and the Common Language Runtime. A growing family of solutions and an active and enthusiastic contributing community is helping position Mono to become the leading choice for development of cross platform applications.

* [Mono Project homepage](http://www.mono-project.com/)
* [http://en.wikipedia.org/wiki/Mono_(software)](http://en.wikipedia.org/wiki/Mono_(software))

![logo](https://github.com/mono/docker/raw/master/logo.png)

# How to use this image

This image will run stand-alone Mono console apps.

## Create a `Dockerfile` in your Mono app project

This example Dockerfile will run an executable called `TestingConsoleApp.exe`.

    FROM mono:3.10-onbuild
	CMD [ "mono",  "./TestingConsoleApp.exe" ]

Place this file in the root of your app, next to the `.sln` solution file. Modify the exectuable name to match what you want to run.

This image includes `ONBUILD` triggers that adds your app source code to `/usr/src/app/source`, restores NuGet packages and compiles the app, placing the output in `/usr/src/app/build`.

With the Dockerfile in place, you can build and run a Docker image with your app:

    docker build -t my-app .
    docker run my-app

You should see any output from your app now.

# Credits

This Docker image is provided by Xamarin, for users of the Mono Project.

Thanks to [Michael Friis](http://friism.com/) for his preliminary work.

# Issues

Please report issues on the [GitHub project](https://github.com/mono/docker).

# License

This Docker Image is licensed with the Expat License. See the [Mono Project licensing FAQ](http://www.mono-project.com/docs/faq/licensing/) for details on how Mono and associated libraries are licensed.
