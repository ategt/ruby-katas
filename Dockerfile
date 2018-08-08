FROM ruby:2.3.3
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /workdir
WORKDIR /workdir


# Copy the current directory contents into the container at /workdir
# ADD . /workdir