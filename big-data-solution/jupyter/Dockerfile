ARG debian_buster_image_tag=11-jre-slim
FROM openjdk:${debian_buster_image_tag}

# Arguments for Scala and workspace
ARG scala_version="2.13.16"
ARG build_date
ARG shared_workspace=/opt/workspace

# Create necessary directories
RUN mkdir -p ${shared_workspace}/data
RUN mkdir -p /usr/share/man/man1

# Update apt and install required packages
RUN apt-get update -y && \
    apt-get install -y curl python3 procps python3-pip python3-dev && \
    rm -rf /var/lib/apt/lists/*

# Set Python 3 as default python
RUN ln -s /usr/bin/python3 /usr/bin/python

# Set environment variables (if needed for workspace)
ENV SHARED_WORKSPACE=${shared_workspace}

# Volume for shared workspace
VOLUME ${shared_workspace}

# JupyterLab + Python kernel for PySpark
ARG spark_version="3.5.5"
ARG jupyterlab_version="4.4.0"

# Copy workspace files (if any)
COPY workspace/ /workspace/

# Install Python packages and PySpark
RUN pip3 install --upgrade pip && \
    pip3 install wget==3.2 pyspark==${spark_version} jupyterlab==${jupyterlab_version} && \
    pip3 install numpy pandas lightgbm matplotlib 

# Expose JupyterLab port
EXPOSE 8888

# Set the working directory to /workspace
WORKDIR /workspace

# Start JupyterLab with no token
# CMD jupyter lab --ip=0.0.0.0 --port=8888 --no-browser --allow-root --NotebookApp.token=''
CMD ["jupyter", "lab", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root", "--NotebookApp.token="]

