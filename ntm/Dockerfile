# Use the ncbi/blast:latest image as the base image
FROM ncbi/blast:latest

# Set the working directory
WORKDIR /blast/blastdb/

# Run the commands to download and extract the database
RUN wget ftp://ftp.ncbi.nlm.nih.gov/blast/db/16S_ribosomal_RNA.tar.gz && \
    tar -xvf 16S_ribosomal_RNA.tar.gz && \
    rm 16S_ribosomal_RNA.tar.gz

# Set the working directory back to /home
WORKDIR /home
