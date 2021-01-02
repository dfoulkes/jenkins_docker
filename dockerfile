
FROM jenkins/jenkins:lts

USER root
####### INSTALL DOCKER CLI
RUN set -eux; \
  apt-get update; \
  apt-get install -y --no-install-recommends \
    gnupg2 \
    software-properties-common; \
  curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -; \
  add-apt-repository \
     "deb [arch=amd64] https://download.docker.com/linux/debian \
     $(lsb_release -cs) \
     stable"; \
  apt-get update; \
  apt-get install -y --no-install-recommends \
    docker-ce-cli \
    containerd.io; \
  rm -rf /var/lib/apt/lists/*
  
USER jenkins
                      
####### INSTALL PLUGINS #########
COPY plugins.txt /usr/share/jenkins/ref/plugins.txt                    
RUN /usr/local/bin/install-plugins.sh \
 < /usr/share/jenkins/ref/plugins.txt

####### DISABLE SETUP WIZARD #######                      
RUN echo $JENKINS_VERSION > \
 /usr/share/jenkin/ref/jenkins.install.UpgradeWizard.state; \
 echo $JENKINS_VERSION > \
 /usr/share/jenkins/ref/jenkins.install.InstallUtil.lastExecVersion

####### CONFIGURE JENKINS AND INSTALLED PLUGINS #######  
ENV CASC_JENKINS_CONFIG /var/jenkins_home/casc_configs
RUN mkdir -p /var/jenkins_home/casc_configs
COPY jenkins.yaml /var/jenkins_home/casc_configs/jenkins.yaml
