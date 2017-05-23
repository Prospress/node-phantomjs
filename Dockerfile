FROM selenium/node-base:3.4.0-chromium
MAINTAINER Prospress <docker@prospress.com>

USER root

#==============
# PhantomJS
#==============
RUN apt-get update -y
RUN apt-get install bzip2 libfreetype6 libfontconfig1 libicu55  -y
RUN wget https://raw.githubusercontent.com/prospress/phantomjs/2-1-1-hub-fix/downloads/phantomjs-2.1.1-linux-x86_64.tar.bz2
RUN tar -xvjf phantomjs-2.1.1-linux-x86_64.tar.bz2 && rm phantomjs-2.1.1-linux-x86_64.tar.bz2
RUN mv /phantomjs-2.1.1-linux-x86_64 /usr/local/phantomjs-2.1.1-linux-x86_64
RUN ln -s /usr/local/phantomjs-2.1.1-linux-x86_64/bin/phantomjs /usr/local/bin/phantomjs

#==============================
# Scripts to run Selenium Node
#==============================
COPY entry_point.sh /opt/bin/entry_point.sh
RUN chmod +x /opt/bin/entry_point.sh

#============================
# Some configuration options
#============================
ENV SCREEN_WIDTH 1360
ENV SCREEN_HEIGHT 1020
ENV SCREEN_DEPTH 24
ENV DISPLAY :99.0
ENV NODE_APPLICATION_NAME ""

USER seluser

CMD ["/opt/bin/entry_point.sh"]
