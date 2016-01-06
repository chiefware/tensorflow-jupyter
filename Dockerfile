# Pull base image.
FROM jupyter/all-spark-notebook
MAINTAINER xblaster@lo2k.net

RUN chown 777 /bin/bash
RUN id
RUN rm /bin/sh && ln -s /bin/bash /bin/sh
RUN /bin/bash -c "source activate /opt/conda/envs/python2/ && pip install https://storage.googleapis.com/tensorflow/linux/cpu/tensorflow-0.5.0-cp27-none-linux_x86_64.whl"
RUN apt-get install -y libx11-dev
RUN /bin/bash -c "source activate /opt/conda/envs/python2/ && pip install Pillow==2.9.0 matplotlib sklearn"

USER root


VOLUME /notebook
WORKDIR /notebook
RUN chown -R 777 /notebook 
EXPOSE 8888
CMD jupyter notebook --data-dir $USER --no-browser --ip=0.0.0.0
