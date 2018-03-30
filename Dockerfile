FROM ubuntu:latest
MAINTAINER JJ Asghar jj@chef.io

RUN apt-get update \
    && apt-get install -y sudo curl \
    && curl -sL https://deb.nodesource.com/setup_6.x | sudo bash - \
    && apt-get install -y supervisor nodejs \
    && apt-get update --fix-missing \
    && apt-get install -y daemon git build-essential \
    && mkdir -p /srv/cookbook-guide/ /var/log/supervisor

COPY dockerfiles/reveal.json /tmp/reveal.json

RUN git clone https://github.com/chef-partners/cookbook-guide.git /srv/cookbook-guide

RUN for each in /srv/cookbook-guide/docs/*.md; do cat $each; echo "\n---\n"; done > /tmp/index.md

RUN npm install -g reveal-md

RUN cp /srv/cookbook-guide/docs/theme/chef.css /usr/lib/node_modules/reveal-md/node_modules/reveal.js/css/theme/

RUN cp /srv/cookbook-guide/docs/theme/chef.css /usr/lib/node_modules/reveal-md/node_modules/reveal.js/css/theme/source/

COPY dockerfiles/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

RUN echo "Thanks\!\n\nChef's Technical Alliance Team\n\n<partnereng@chef.io>" >> /tmp/index.md

EXPOSE 1948

CMD ["/usr/bin/supervisord"]
