FROM rocker/r-ver:3.5.2

ENV DEBIAN_FRONTEND=noninteractive
RUN BUILDPKGS="apt-utils libssl-dev libcurl4-openssl-dev zlib1g-dev libssh2-1-dev libv8-dev libgsl-dev libxml2-dev libpng-dev" && \
    apt-get update && \
    apt-get install -y $BUILDPKGS && \
    rm -rf /var/lib/apt/lists/*

RUN Rscript -e "install.packages( c('git2r','devtools','BiocManager') )"
RUN Rscript -e "BiocManager::install('SingleCellExperiment')" && \
    Rscript -e "BiocManager::install('BioQC', version = '3.8')" && \
    Rscript -e "BiocManager::install('org.Hs.eg.db', version = '3.8')" && \
    Rscript -e "BiocManager::install('org.Mm.eg.db', version = '3.8')"

RUN Rscript -e "devtools::install_github('iaconogi/bigSCale2')"

RUN apt-get remove --purge -y $BUILDPKGS

ENTRYPOINT ["R"]

