FROM ubuntu:latest

RUN apt-get update && apt-get install mutt tar wget gzip -y

COPY test.yaml /
COPY uat-runner.sh /
COPY body.html /

RUN mkdir -p /root/.mutt/cache/headers
RUN mkdir /root/.mutt/cache/bodies
RUN touch /root/.mutt/certificates

COPY muttrc /root/.mutt/muttrc
COPY .mutt_certificates /root
COPY .mutt_certificates /root/.mutt

RUN chmod 755 /uat-runner.sh

WORKDIR /
RUN wget https://github.com/Kong/insomnia/releases/download/lib%408.2.0/inso-linux-8.2.0.tar.xz
RUN tar -xJf inso-linux-8.2.0.tar.xz

ENTRYPOINT ["/bin/bash", "-c", "./uat-runner.sh"]