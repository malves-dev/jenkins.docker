FROM jenkins/jenkins:latest
USER root
RUN apt-get update && apt-get install -y make git openjdk-8-jdk
RUN mkdir /srv/backup && chown jenkins:jenkins /srv/backup
USER jenkins
COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64

# Comandos relacionados com este arquivo:
# Cria uma imagem de acordo com os descritivos no Dockerfile
# docker build . --tag malves/lab-devops-jenkins:0.3.0
# Cria um container respondendo na porta 8080 e expondo os volumes
# docker run --name jenkins-v030 -p 8080:8080 -v jenkins_home:/var/jenkins_home -v jenkins_backup:/srv/backup malves/lab-devops-jenkins:0.3.0

# Verificar pasta de backup do container jenkins-v030
# docker exec -it jenkins-v030 bash
# Verificar volumes de backup no container e local
# docker inspect jenkins-v030 | grep backup
# Copia os backups para pasta local
# docker cp jenkins-v030:/svr/backup ./config_jenkins