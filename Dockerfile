FROM node:14

ENV LIBPOSTAL_DIR="/libpostal"

# Install libpostal dependencies
RUN apt-get update && apt-get install -y \
    curl autoconf automake libtool pkg-config build-essential

RUN mkdir -p $LIBPOSTAL_DIR
RUN git clone https://github.com/openvenues/libpostal $LIBPOSTAL_DIR

# Compile and install libpostal
WORKDIR $LIBPOSTAL_DIR
RUN ./bootstrap.sh && ./configure
RUN make && make install && ldconfig

