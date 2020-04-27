#!/bin/bash

oc login -u developer -p developer

echo "Creating project...\n"
oc new-project hello-world

echo "Adding image streams...\n"
BASEURL=https://raw.githubusercontent.com/jboss-fuse/application-templates/application-templates-2.1.0.fuse-760043-redhat-00001
oc create -n hello-world -f ${BASEURL}/fis-image-streams.json

echo "Adding spring-boot quickstarts...\n"
for template in eap-camel-amq-template.json \
 eap-camel-cdi-template.json \
 eap-camel-cxf-jaxrs-template.json \
 eap-camel-cxf-jaxws-template.json \
 eap-camel-jpa-template.json \
 karaf-camel-amq-template.json \
 karaf-camel-log-template.json \
 karaf-camel-rest-sql-template.json \
 karaf-cxf-rest-template.json \
 spring-boot-camel-amq-template.json \
 spring-boot-camel-config-template.json \
 spring-boot-camel-drools-template.json \
 spring-boot-camel-infinispan-template.json \
 spring-boot-camel-rest-sql-template.json \
 spring-boot-camel-rest-3scale-template.json \
 spring-boot-camel-template.json \
 spring-boot-camel-xa-template.json \
 spring-boot-camel-xml-template.json \
 spring-boot-cxf-jaxrs-template.json \
 spring-boot-cxf-jaxws-template.json ;
do
 oc create -n hello-world -f \
 https://raw.githubusercontent.com/jboss-fuse/application-templates/application-templates-2.1.0.fuse-760043-redhat-00001/quickstarts/${template}
done

echo "Adding spring-boot2 quickstarts...\n"
for template in spring-boot-2-camel-amq-template.json \
 spring-boot-2-camel-config-template.json \
 spring-boot-2-camel-drools-template.json \
 spring-boot-2-camel-infinispan-template.json \
 spring-boot-2-camel-rest-3scale-template.json \
 spring-boot-2-camel-rest-sql-template.json \
 spring-boot-2-camel-teiid-template.json \
 spring-boot-2-camel-template.json \
 spring-boot-2-camel-xa-template.json \
 spring-boot-2-camel-xml-template.json \
 spring-boot-2-cxf-jaxrs-template.json \
 spring-boot-2-cxf-jaxws-template.json \
 spring-boot-2-cxf-jaxrs-xml-template.json \
 spring-boot-2-cxf-jaxws-xml-template.json ;
do oc create -n hello-world -f \
 https://raw.githubusercontent.com/jboss-fuse/application-templates/application-templates-2.1.0.fuse-sb2-760039-redhat-00001/quickstarts/${template}
done

echo "Adding templates for Fuse Console...\n"
oc create -n hello-world -f https://raw.githubusercontent.com/jboss-fuse/application-templates/application-templates-2.1.0.fuse-760043-redhat-00001/fis-console-namespace-template.json
echo "Adding Console App...\n"
oc new-app -n hello-world -f https://raw.githubusercontent.com/jboss-fuse/application-templates/application-templates-2.1.0.fuse-760043-redhat-00001/fis-console-namespace-template.json

echo "Adding apicurito...\n"
oc create -n hello-world -f ${BASEURL}/fuse-apicurito.yml
