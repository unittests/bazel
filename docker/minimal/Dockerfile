# Install bazel dependencies
RUN apt-get update \
    && apt-get install -y \
        g++ \
        git \
        wget \
        zip \
        zlib1g-dev \
    && rm -rf /var/lib/apt/lists/*

# Install Java
ENV JAVA_HOME /opt/jdk
ENV PATH $JAVA_HOME/bin:$PATH
RUN wget \
        -qO- \
        --no-check-certificate \
        --no-cookies \
        --header "Cookie: oraclelicense=accept-securebackup-cookie" \
        http://download.oracle.com/otn-pub/java/jdk/8u45-b14/jdk-8u45-linux-x64.tar.gz | tar xvz -C /opt \
    && mv /opt/jdk1.8.0_45 /opt/jdk

# Install Bazel
ENV PATH $PATH:/opt/bazel/output
RUN mkdir /opt/bazel \
    && cd /opt/bazel \
    && git clone https://github.com/bazelbuild/bazel . \
    && ./compile.sh

