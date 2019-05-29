FROM sebp/elk

RUN curl -L -O https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-7.1.0-amd64.deb && dpkg -i filebeat-7.1.0-amd64.deb

VOLUME ['/var/logs']

