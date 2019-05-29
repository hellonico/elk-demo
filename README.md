# ES+kibana+logstash



https://elk-docker.readthedocs.io/#forwarding-logs

http://redmine.otc/redmine/issues/25533

http://localhost:9200/_search?pretty

http://localhost:5601/app/kibana

```
 docker exec -it elk /bin/bash
```

to read:

https://www.shortn0tes.com/2018/02/elk-stack-with-log4j.html

# logstash

```
cd /opt/logstash
./bin/logstash-plugin list

./bin/logstash-plugin install logstash-input-beats
./bin/logstash-plugin install logstash-input-log4j
```



## Filebeat manually

```
curl -L -O https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-7.1.0-amd64.deb
dpkg -i filebeat-7.1.0-amd64.deb
```

## 



https://github.com/spujadas/elk-docker/issues/92


[http://localhost:5601/app/kibana](http://localhost:5601/app/kibana)

```
/etc/init.d/filebeat start
```
# configure

## configure filebeat

```
filebeat.inputs:
- type: log
  paths:
    - /var/logs/*.log
  fields:
    docker: true
  fields_under_root: true
output.elasticsearch:
  enabled: false
output.logstash:
  hosts: ["172.16.4.154:5044"]
```

## configure logstash

https://www.elastic.co/guide/en/beats/filebeat/current/filebeat-input-log.html

```
filter {
	 dissect {
      mapping => {
        "message" => "%{ts} %{+ts} %{level} %{thread} %{logger} %{msg}"
      }
    }
}
```

You can also use grok...


## configure 

# Q&A

## running on docker not enough resources
https://www.elastic.co/guide/en/beats/filebeat/current/running-on-docker.html
```
sudo sysctl -w vm.max_map_count=262144
```

## update logstash input ssl settings in /etc/logstash
https://github.com/logstash-plugins/logstash-input-beats/issues/320