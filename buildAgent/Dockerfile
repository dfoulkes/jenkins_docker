#         NOTES
#
#          This docker image is nothing todo with docker compose but for pipeline builds, 
#          so that the Jenkins file can build this project, it needs a image with 
#          docker compose installed.
#

from ubuntu
    RUN apt-get update
    RUN apt install -y \
        apt-transport-https \
        ca-certificates \
        curl \
        gnupg-agent \
        software-properties-common
    RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
    RUN add-apt-repository \
        "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
        $(lsb_release -cs) \
        stable"
    RUN apt update
    RUN apt install -y docker-ce docker-ce-cli containerd.io   
    RUN curl -L "https://github.com/docker/compose/releases/download/1.27.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    RUN chmod +x /usr/local/bin/docker-compose
    RUN ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose       