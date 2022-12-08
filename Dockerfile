# base image. It is available for amd64 and arm64 architectures.
# https://github.com/ContinuumIO/docker-images/blob/master/miniconda3/debian/Dockerfile

FROM continuumio/miniconda3:4.12.0

RUN apt update && apt install -y make

# Override miniconda python installation
RUN conda install python=3.10 matplotlib=3.5 pandas=1.4 pandoc=2

RUN pip install docopt-ng==0.8.*

RUN apt-get install r-base r-base-dev -y

RUN Rscript -e "install.packages('rmarkdown', 'here')"