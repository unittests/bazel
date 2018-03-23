# Use Ubuntu
FROM ubuntu:latest

# Run update before installing any packages
RUN apt-get update

# Install Java
ENV JAVA_TAR http://download.oracle.com/otn-pub/java/jdk/8u161-b12/2f38c3b165be4555a1fa6e98c45e0808/jdk-8u161-linux-x64.tar.gz
ENV JAVA_HOME /opt/jdk
ENV PATH ${JAVA_HOME}/bin:${PATH}
RUN apt-get install -y wget
RUN cd /opt && wget -qO- --no-check-certificate -c --header "Cookie: oraclelicense=accept-securebackup-cookie" ${JAVA_TAR} | tar -xvz
RUN mv /opt/jdk* ${JAVA_HOME}

# Clone Bazel repo
ENV BAZEL_PATH /opt/bazel
ENV PATH $PATH:$BAZEL_PATH/output
RUN mkdir $BAZEL_PATH
RUN apt-get install -y git
RUN cd $BAZEL_PATH && git clone https://github.com/bazelbuild/bazel .

# Install Protoc
RUN apt-get install -y curl zip dh-autoreconf
ENV PROTOC_PATH $BAZEL_PATH/third_party/protobuf/3.4.0
RUN cd $PROTOC_PATH && ./autogen.sh
RUN cd $PROTOC_PATH && ./configure
RUN cd $PROTOC_PATH && make
RUN cd $PROTOC_PATH && make install
RUN cd $PROTOC_PATH && ldconfig
ENV PROTOC /usr/local/bin/protoc

# Install Grpc
#TODO

# Install Bazel
RUN cd $BAZEL_PATH && ./compile.sh

# Cleanup package lists
RUN rm -rf /var/lib/apt/lists/*
