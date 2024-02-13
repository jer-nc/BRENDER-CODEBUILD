FROM public.ecr.aws/docker/library/ubuntu:22.04

## CPU DOCKERFILE

ARG BLENDER_VERSION=${BLENDER_VERSION}
ARG BLENDER_VERSION_MAJOR=${BLENDER_VERSION_MAJOR}
ENV BLENDER_URL https://mirror.clarkson.edu/blender/release/Blender${BLENDER_VERSION}/blender-${BLENDER_VERSION_MAJOR}-linux-x64.tar.xz


# Install dependencies
RUN apt-get update -y && \
    apt-get install -y \
    sudo \
    curl \
    ca-certificates \
    zip \
    xz-utils \
    python3 \
    python3-pip \
    tree

# Download and install Blender
RUN curl "${BLENDER_URL}" -o "blender.tar.xz" && \
    tar -xvf blender.tar.xz --strip-components=1 -C /bin && \
    rm -rf blender.tar.xz && \
    rm -rf blender

RUN apt-get update -y && \
    apt-get install -y \
    libx11-dev \
    libxi-dev \
    libxxf86vm-dev \
    libfontconfig1 \
    libxrender1 \
    libgl1-mesa-glx \
    libxkbcommon-x11-0 \
    libsm6 

RUN pip3 install boto3
RUN pip install requests



# Give execute permissions to the script
COPY ./app.py /
RUN chmod +x /app.py

# Copiar el script de verificación al contenedor
COPY check_efs.sh /usr/local/bin/check_efs.sh

# Establecer permisos de ejecución para el script
RUN chmod +x /usr/local/bin/check_efs.sh

WORKDIR /

ENTRYPOINT ["/usr/local/bin/check_efs.sh"]
 