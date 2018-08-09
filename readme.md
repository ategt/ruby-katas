# Ruby Katas

### Background

I went to a ruby meetup a few days ago, and discovered that I had not done ruby in about a year.  After quite a bit of trouble getting ruby working on my rig, I remembered why I left the language, but decided not to be detered, and vowed to do more katas in ruby.

### Quick Start

This is what I did to get it running.

```
docker build --tag ruby-katas .
docker run -v ~/Documents/_repos/docker/katas:/workdir -it ruby-katas /bin/sh
```

then

```
bundle install
bundle exec rspec .
```