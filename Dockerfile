# Use the official Miniconda image
FROM continuumio/miniconda3:latest

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
    apt-get -y install git gcc g++ && \
    rm -rf /var/lib/apt/lists/*

# Copy the reinvent.yml file into the Docker image
COPY photoacid_environment.yml .

RUN conda env create -f photoacid_environment.yml

# Install pip manually in case it is missing in the environment
RUN conda run -n photoacid python -m ensurepip --upgrade
RUN conda run -n photoacid python -m pip install --upgrade pip setuptools wheel

# Set the default shell to use bash and activate the conda environment
ENTRYPOINT ["conda", "run", "--no-capture-output", "-n", "photoacid"]
