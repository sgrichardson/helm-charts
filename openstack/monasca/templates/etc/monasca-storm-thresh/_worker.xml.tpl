{{- define "monasca_storm_thresh_worker_xml_tpl" -}}
<?xml version="1.0" encoding="UTF-8"?>
<!--
 Licensed to the Apache Software Foundation (ASF) under one or more
 contributor license agreements.  See the NOTICE file distributed with
 this work for additional information regarding copyright ownership.
 The ASF licenses this file to You under the Apache License, Version 2.0
 (the "License"); you may not use this file except in compliance with
 the License.  You may obtain a copy of the License at

     http://www.apache.org/licenses/LICENSE-2.0

 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.
-->

<configuration monitorInterval="60">
<properties>
    <property name="pattern">%d{yyyy-MM-dd HH:mm:ss.SSS} %c{1.} [%p] %msg%n</property>
    <property name="patternNoTime">%msg%n</property>
    <property name="patternMetrics">%d %-8r %m%n</property>
</properties>
<Appenders>
    <Console name="STDOUT" target="SYSTEM_OUT">
        <PatternLayout pattern="${pattern}"/>
    </Console>
</Appenders>
<loggers>
    <root level="{{.Values.monasca_storm_thresh_loglevel}}"> <!-- We log everything -->
        <appender-ref ref="STDOUT"/>
    </root>
    <Logger name="org.apache.storm.metric.LoggingMetricsConsumer" level="{{.Values.monasca_storm_thresh_loglevel}}" additivity="false">
        <appender-ref ref="STDOUT"/>
    </Logger>
    <Logger name="STDERR" level="{{.Values.monasca_storm_thresh_loglevel}}">
        <appender-ref ref="STDOUT"/>
    </Logger>
</loggers>
</configuration>
{{ end }}