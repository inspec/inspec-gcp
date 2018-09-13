FROM ruby:2.5
MAINTAINER Chef Software, Inc. <docker@chef.io>

ARG TF_VERSION=0.11.8

COPY Gemfile .
RUN bundle install
RUN gem list && apt-get update
RUN apt-get install unzip
ADD https://releases.hashicorp.com/terraform/${TF_VERSION}/terraform_${TF_VERSION}_linux_amd64.zip .
RUN unzip terraform_${TF_VERSION}_linux_amd64.zip && mv terraform /usr/local/bin/ && mkdir /inspec
RUN rm terraform_${TF_VERSION}_linux_amd64.zip
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
WORKDIR /inspec
