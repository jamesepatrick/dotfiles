FROM alpine:latest

RUN apk add vim \
  zsh \
  make \
  git \
  openssh-client \
  perl

ARG USER=test
ENV HOME /home/$USER

RUN adduser -D -s /bin/zsh $USER
USER $USER
WORKDIR $HOME

CMD git clone https://git.jpatrick.io/james/dotfiles.git \
  && cd dotfile \
  && make install
