[![Build and Publish Docker Image](https://github.com/lobis/rest-for-physics-demo/actions/workflows/docker.yml/badge.svg)](https://github.com/lobis/rest-for-physics-demo/actions/workflows/docker.yml)

[![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/lobis/rest-for-physics-demo/HEAD?labpath=demo.ipynb)


# [REST-for-Physics](https://github.com/rest-for-physics/framework) demo

## How to run

You can inmediatly run the notebook with [Binder](https://mybinder.org/v2/gh/lobis/rest-for-physics-demo/HEAD?labpath=demo.ipynb).


You can also run the notebook server locally via:

```
docker run -it --rm -p 8888:8888 ghcr.io/lobis/rest-for-physics-demo:latest jupyter-lab --ip=0.0.0.0 --port=8888
```
