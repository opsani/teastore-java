FROM descartesresearch/teastore-webui:latest

COPY update_env.sh /usr/local/tomcat/bin/update_env.sh

CMD java -jar /usr/local/tomcat/bin/dockermemoryconfigurator.jar ${TOMCAT_HEAP_MEM_PERCENTAGE}; \
  /usr/local/tomcat/bin/start.sh && /usr/local/tomcat/bin/update_env.sh \
  && echo '<% response.sendRedirect("/tools.descartes.teastore.webui/"); %>' > /usr/local/tomcat/webapps/ROOT/index.jsp \
  && /usr/local/tomcat/bin/catalina.sh run