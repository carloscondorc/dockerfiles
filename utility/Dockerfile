FROM ubuntu:16.04
MAINTAINER Jon Mosco "jonny.mosco@gmail.com"

RUN apt-get update && apt-get install -y \
    bash-completion \
    build-essential \
    curl \
    git \
    htop \
    iputils-ping \
    man \
    net-tools \
    procps \
    python \
    python-pip \
    python3 \
    python3-pip \
    sudo \
    vim \
    wget \
    zsh \
&& rm -rf /var/lib/apt/lists/* \
&& apt-get clean \
&& apt-get autoremove -y

# create and use jmosco account
RUN groupadd -r jmosco && useradd --no-log-init -r -g jmosco jmosco \
    && echo 'jmosco ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers

# kubectl
RUN curl -o /usr/local/bin/kubectl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl \
  && chmod +x /usr/local/bin/kubectl

# kubectx and kubens
RUN mkdir -p /home/jmosco/bin && mkdir -p /home/jmosco/repos \
  && git clone https://github.com/ahmetb/kubectx.git /home/jmosco/repos/kubectx \
  && cp /home/jmosco/repos/kubectx/kubectx /home/jmosco/bin \
  && cp /home/jmosco/repos/kubectx/kubens /home/jmosco/bin \
  && git clone https://github.com/jonmosco/kube-ps1 /home/jmosco/repos/kube-ps1


USER jmosco

WORKDIR /home/jmosco
ENV TERM=xterm-256color
ENV LANG en_US.UTF-8

# setup dotfiles
RUN sudo chown -R jmosco: /home/jmosco \
    && git clone https://github.com/jonmosco/dotfiles.git .dotfiles \
    && cd .dotfiles && make all
