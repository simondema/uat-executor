FROM ubuntu:latest

RUN apt-get update && apt-get install mutt tar wget gzip -y

COPY test.yaml /
COPY uat-runner.sh /
COPY body.html /

RUN mkdir /root/.mutt

COPY muttrc /root/.mutt/muttrc
RUN touch /root/.mutt/certificates
RUN touch /root/.mutt_certificates

RUN chmod 755 /uat-runner.sh

WORKDIR /
RUN wget https://github.com/Kong/insomnia/releases/download/lib%408.2.0/inso-linux-8.2.0.tar.xz
RUN tar -xJf inso-linux-8.2.0.tar.xz

ENTRYPOINT ["/bin/bash", "-c", "./uat-runner.sh"]