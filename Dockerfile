FROM oraclelinux:8.4
LABEL email=kris@crisis.com
RUN yum install httpd -y && mkdir /common /common/webapp1 /common/webapp2 /common/webapp3
COPY html-sample-app /common/webapp1 
COPY project-html-website /common/webapp2/
ADD project-website-template /common/webapp3
COPY deploy.sh /common/
WORKDIR /common
RUN chmod +x deploy.sh
ENTRYPOINT ["./deploy.sh"]
