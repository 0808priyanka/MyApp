FROM jboss/wildfly
RUN yum -y install wget 
RUN wget -q --user=${FT_USER} --password=${FTP_PSWD} ftp://${FTP_HOSTNAME}:${FTP_PORT}/${FTP_PATH}/${APP_NAME}.ear -P /opt/jboss/wildfly/standalone/deployments/
RUN wget -q --user=${FT_USER} --password=${FTP_PSWD} ftp://${FTP_HOSTNAME}:${FTP_PORT}/${FTP_PATH}/start.sh -P /opt/jboss/wildfly/
USER root
RUN chown jboss:jboss /opt/jboss/wildfly/standalone/deployments/${APP_NAME}.ear
RUN chown jboss:jboss /opt/jboss/wildfly/start.sh
RUN chmod +x /opt/jboss/wildfly/start.sh
USER jboss
CMD /opt/jboss/wildfly/start.sh
