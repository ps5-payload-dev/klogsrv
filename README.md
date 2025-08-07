# klogsrv
This is a simple socket server that redirects the output from /dev/klog on
jailbroken Playstation 4 and 5 consoles to sockets connected on port 3232.

## Building for the PS4
Assuming you have the [ps4-payload-sdk][sdk-ps4] installed on a POSIX machine,
klogsrv can be compiled using the following two commands:
```console
john@localhost:klogsrv$ export PS4_PAYLOAD_SDK=/opt/ps4-payload-sdk
john@localhost:klogsrv$ make -f Makefile.ps4
```

## Building for the PS5
Assuming you have the [ps5-payload-sdk][sdk-ps5] installed on a POSIX machine,
klogsrv can be compiled using the following two commands:
```console
john@localhost:klogsrv$ export PS5_PAYLOAD_SDK=/opt/ps5-payload-sdk
john@localhost:klogsrv$ make -f Makefile.ps5
```

## Usage
To view the output of /dev/klog from your Playstation, connect to klogsrv
using netcat:
```console
john@localhost:klogsrv$ nc $HOSTNAME_OR_IP 3232
```

## Reporting Bugs
If you encounter problems with klogsrv, please [file a github issue][issues].
If you plan on sending pull requests which affect more than a few lines of code,
please file an issue before you start to work on you changes. This will allow us
to discuss the solution properly before you commit time and effort.

## License
klogsrv is licensed under the GPLv3+.

[sdk-ps4]: https://github.com/ps4-payload-dev/sdk
[sdk-ps5]: https://github.com/ps5-payload-dev/sdk
[issues]: https://github.com/ps5-payload-dev/klogsrv/issues/new

