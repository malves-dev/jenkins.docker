# LAB Jenkins && Docker

A idéia aqui é instalar e configurar o jenkins em cima de uma imagem Docker, de acordo com as nossa necessidades, então teremos várias versões desta imagem. 

### Acões do Dockerfile

- Versão 0.1.0

  - Instalar imagem do Jenkins na versão lst(Long-Term Support)
  - Instalar Open JDK 
  - Instalar Git
  - Link da versão: https://hub.docker.com/malves/lab-devops-jenkins:0.1.0

- Versão 0.2.0

  - Instalar Plugins no Jenkins com base no arquivo plugins.txt
  - Link da versão: https://hub.docker.com/malves/lab-devops-jenkins:0.2.0

- Versão 0.3.0

  - Automacão de Backup e Restore
    - Alterar senha de admin do Jenkins
    - Configurar JDK no Jenkins
    - Criar 2 Jobs de teste
    - Criar backup
    - Executar backup
    - Obter backup
  - Link da versão: https://hub.docker.com/malves/lab-devops-jenkins:0.3.0

  # docker build --tag malves/lab-devops-jenkins:0.3.0
  # docker run --name jenkins-v030 -p 8080:8080 -v jenkins_home:/var/jenkins_home -v jenkins_backup:/srv/backup malves/lab-devops-jenkins:0.3.0
