To build static content, run

```
cactus build
```

and take files from `.build` directory.

Update https://github.com/decent-im/decent-im.github.io repo with these files.

Cactus doesn't work well on modern Python 3.
To get a working build environment, you can use

```
podman run --security-opt label=disable -v $PWD:/my -p8000:8000 -it python:2.7 /bin/bash
```
