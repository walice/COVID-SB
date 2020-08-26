FROM jupyter/scipy-notebook:b2562c469cdd

# START Binder compatibility code
# from https://mybinder.readthedocs.io/en/latest/tutorials/dockerfile.html

ARG NB_USER
ARG NB_UID
ENV USER ${NB_USER}
ENV NB_UID ${NB_UID}
ENV HOME /home/${NB_USER}

COPY . ${HOME}/work
USER root
RUN chown -R ${NB_UID} ${HOME}

# END binder compatibility code

USER ${NB_USER}

# Add modification code here

# Jupyter Notebook extensions
RUN \
    pip install jupyter_contrib_nbextensions && \
    jupyter contrib nbextension install --sys-prefix
RUN jupyter nbextensions_configurator enable --sys-prefix

# Packages
RUN pip install jupyterthemes gspread papermill pytz
RUN pip install --upgrade oauth2client