# M1 Mac用のDocker image
# Intel CPUのMacの時は以下にする
# FROM ruby:2.6.2
FROM --platform=linux/amd64 ruby:2.6.2
ENV LANG C.UTF-8
ENV TZ=Asia/Tokyo

RUN /bin/cp -f /usr/share/zoneinfo/Asia/Tokyo /etc/localtime
# RUN curl -sL https://deb.nodesource.com/setup_8.x | bash - \
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash - \
    && apt-get update -qq \
    && apt-get install -y build-essential nodejs postgresql-client git

ENV APP_HOME /var/src/app
RUN mkdir -p $APP_HOME
WORKDIR $APP_HOME
ADD Gemfile $APP_HOME/Gemfile
ADD Gemfile.lock $APP_HOME/Gemfile.lock

ENV BUNDLE_DISABLE_SHARED_GEMS 1
RUN bundle install -j4
