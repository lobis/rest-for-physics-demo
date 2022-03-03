ARG BASE_IMAGE_TAG=root-geant4-garfield_cpp17_ROOT-v6-24-06_Geant4-v10.4.3_Garfield-4.0-REST_master

FROM ghcr.io/lobis/rest-for-physics-demo:${BASE_IMAGE_TAG}

LABEL maintainer.name="Luis Obis"
LABEL maintainer.email="luis.antonio.obis@gmail.com"

LABEL org.opencontainers.image.source="https://github.com/lobis/rest-for-physics-demo"

ARG NB_USER=user
ARG NB_UID=1000
ENV USER ${NB_USER}
ENV NB_UID ${NB_UID}
ENV HOME /home/${NB_USER}

RUN adduser --disabled-password \
    --gecos "Default user" \
    --uid ${NB_UID} \
    ${NB_USER}

USER root
RUN mv /root/* /home/${NB_USER}/ && chown -R ${NB_UID} ${HOME}
USER ${NB_USER}

CMD ["/bin/bash"]
