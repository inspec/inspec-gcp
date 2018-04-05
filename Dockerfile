FROM ruby:2.5

COPY Gemfile .
RUN bundle install && gem list && apt-get update && apt-get install unzip
ADD https://releases.hashicorp.com/terraform/0.11.5/terraform_0.11.5_linux_amd64.zip?_ga=2.134313713.1219822892.1522329583-243569858.1522329583 .
RUN unzip terraform_0.11.5_linux_amd64.zip && mv terraform /usr/local/bin/ && mkdir /inspec
WORKDIR /inspec

