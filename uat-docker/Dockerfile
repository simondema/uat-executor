FROM ubuntu:latest

RUN apt-get update && apt-get install mutt -y

COPY inso /
COPY test.yaml /
COPY uat-runner.sh /
COPY body.html /

RUN mkdir -p /root/.mutt/cache/headers
RUN mkdir /root/.mutt/cache/bodies
RUN touch /root/.mutt/certificates

COPY muttrc /root/.mutt/muttrc
COPY .mutt_certificates /root
COPY .mutt_certificates /root/.mutt

RUN chmod 755 /inso
RUN chmod 755 /uat-runner.sh

WORKDIR /
ENTRYPOINT ["/bin/bash", "-c", "./uat-runner.sh"]