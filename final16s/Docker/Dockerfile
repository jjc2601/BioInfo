# Set the base image to Ubuntu 20.04 LTS
FROM --platform=linux/amd64 ubuntu:jammy

# My authorship
LABEL maintainer="Johnny Chen"
LABEL version="0.1.0"
LABEL description="docker_project"

# Disable prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive

RUN apt update
RUN apt install -y curl git g++ wget nano zlib1g-dev make bsdmainutils gawk bcftools libopenblas-base

# Install Miniconda package manager
RUN cd tmp
RUN curl https://repo.anaconda.com/miniconda/Miniconda3-py310_23.3.1-0-Linux-x86_64.sh --output miniconda.sh
RUN bash miniconda.sh -bu
ENV PATH="/root/miniconda3/bin:$PATH"
RUN conda update -y conda

# Update conda and install bioconda packages
RUN conda update -y conda && \
    conda install -y -c bioconda blast=2.11.0 && \
    conda install bioconda::seqtk && \
    conda clean -a -y

RUN mkdir blastdb
RUN cd blastdb &&\
    wget ftp://ftp.ncbi.nlm.nih.gov/blast/db/16S_ribosomal_RNA.tar.gz &&\
    tar -xvf 16S_ribosomal_RNA.tar.gz &&\
    rm 16S_ribosomal_RNA.tar.gz

RUN cd blastdb &&\
    wget https://ftp.ncbi.nlm.nih.gov/refseq/TargetedLoci/Bacteria/bacteria.16SrRNA.fna.gz &&\
    gunzip bacteria.16SrRNA.fna.gz &&\
    makeblastdb -in ./bacteria.16SrRNA.fna -dbtype nucl -title 16SMicrobial -out 16SMicrobial -parse_seqids

