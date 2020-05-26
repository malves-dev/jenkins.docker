FROM jenkins/jenkins:latest
USER root
RUN apt-get update && apt-get install -y make git openjdk-8-jdk
RUN mkdir /srv/backup && chown jenkins:jenkins /srv/backup
USER jenkins
RUN echo latest > /usr/share/jenkins/ref/jenkins.install.UpgradeWizard.state
RUN echo latest > /usr/share/jenkins/ref/jenkins.install.InstallUtil.lastExecVersion
COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64
COPY --chown=jenkins:jenkins config_jenkins /var/jenkins_home

# Comandos relacionados com este arquivo:
# Cria uma imagem de acordo com os descritivos no Dockerfile
# docker build . --tag malves/lab-devops-jenkins:0.4.0
# Cria um container respondendo na porta 8080
# docker run --name jenkins-v040 -p 8080:8080 malves/lab-devops-jenkins:0.4.0

# Verificar pasta de backup do container jenkins-v040
# docker exec -it jenkins-v040 bash
# Verificar volumes de backup no container e local
# docker inspect jenkins-v040 | grep backup
# Copia os backups para pasta local
# docker cp jenkins-v040:/svr/backup ./config_jenkins