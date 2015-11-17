# Supported tags and `Dockerfile` links

- [`latest` (*Dockerfile*)](https://github.com/mono/docker/blob/master/3.12.0/Dockerfile)
- [`onbuild` (*onbuild/Dockerfile*)](https://github.com/mono/docker/blob/master/3.12.0/onbuild/Dockerfile)
- [`alpha` (*Dockerfile*)](https://github.com/mono/docker/blob/master/alpha/Dockerfile)
- [`3.12.0` (*Dockerfile*)](https://github.com/mono/docker/blob/master/3.12.0/Dockerfile)
- [`3.12.0-onbuild` (*onbuild/Dockerfile*)](https://github.com/mono/docker/blob/master/3.12.0/onbuild/Dockerfile)
- [`3.10.0` (*Dockerfile*)](https://github.com/mono/docker/blob/master/3.10.0/Dockerfile)
- [`3.10.0-onbuild` (*onbuild/Dockerfile*)](https://github.com/mono/docker/blob/master/3.10.0/onbuild/Dockerfile)
- [`3.8.0` (*Dockerfile*)](https://github.com/mono/docker/blob/master/3.8.0/Dockerfile)
- [`3.8.0-onbuild` (*onbuild/Dockerfile*)](https://github.com/mono/docker/blob/master/3.8.0/onbuild/Dockerfile)

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
