ARG BASE_IMAGE_TAG=cpp17_ROOT-v6-26-00_Geant4-v10.4.3_Garfield-af4a1451_REST-master

FROM ghcr.io/lobis/rest-for-physics-demo:${BASE_IMAGE_TAG}

RUN pip3 -q install pip --upgrade && \
    pip3 install --no-cache-dir notebook jupyterlab_code_formatter black isort autopep8 uproot awkward metakernel

ARG NB_USER=jovyan
ARG NB_UID=1000
ENV USER ${NB_USER}
ENV NB_UID ${NB_UID}
ENV HOME /home/${NB_USER}

RUN adduser --disabled-password \
    --gecos "Default user" \
    --uid ${NB_UID} \
    ${NB_USER}

COPY . ${HOME}
USER root
RUN chown -R ${NB_UID} ${HOME}
USER ${NB_USER}
