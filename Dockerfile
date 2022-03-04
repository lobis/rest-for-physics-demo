ARG BASE_IMAGE_TAG=cpp17_ROOT-v6-26-00_Geant4-v10.4.3_Garfield-af4a1451

FROM ghcr.io/lobis/root-geant4-garfield:${BASE_IMAGE_TAG}

LABEL maintainer.name="Luis Obis"
LABEL maintainer.email="luis.antonio.obis@gmail.com"

LABEL org.opencontainers.image.source="https://github.com/lobis/rest-for-physics-demo"

ARG APPS_DIR=/usr/local
ARG REST_FOR_PHYSICS_VERSION=master

RUN git clone https://github.com/rest-for-physics/framework.git $APPS_DIR/rest-for-physics/source && \
    cd $APPS_DIR/rest-for-physics/source && git reset --hard ${REST_FOR_PHYSICS_VERSION} && \
    yes | python3 pull-submodules.py --clean && \
    mkdir -p $APPS_DIR/rest-for-physics/build && cd $APPS_DIR/rest-for-physics/build && \
    cmake $APPS_DIR/rest-for-physics/source -DREST_WELCOME=OFF -DREST_GARFIELD=OFF -DREST_G4=ON -DRESTLIB_DETECTOR=ON \
    -DRESTLIB_RAW=ON -DRESTLIB_TRACK=ON -DCMAKE_INSTALL_PREFIX=$APPS_DIR/rest-for-physics/install && \
    make -j$(nproc) install && \
    rm -rf $APPS_DIR/rest-for-physics/build $APPS_DIR/rest-for-physics/source

ENV REST_PATH $APPS_DIR/rest-for-physics/install
ENV PATH $APPS_DIR/rest-for-physics/install/bin:$PATH
ENV LD_LIBRARY_PATH $APPS_DIR/rest-for-physics/install/lib:$LD_LIBRARY_PATH
ENV ROOT_INCLUDE_PATH $APPS_DIR/rest-for-physics/install/include:$ROOT_INCLUDE_PATH

RUN echo "source $APPS_DIR/rest-for-physics/install/thisREST.sh" >> ~/.bashrc

WORKDIR /

RUN pip3 -q install pip --upgrade && \
    pip3 install --no-cache-dir notebook jupyterhub jupyterlab_code_formatter black isort autopep8 uproot awkward metakernel

ARG NB_USER=user
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

CMD ["/bin/bash"]
