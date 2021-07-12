FROM openjdk:16-buster

ARG USERNAME
ARG USERID
RUN adduser --gecos "" --uid ${USERID} --disabled-password ${USERNAME} && \
    apt-get update && \
    apt-get install -y zip unzip && \
    apt-get clean && \
    rm -rf /var/cache/apt/archives/* && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    truncate -s 0 /var/log/*log

USER ${USERNAME}
SHELL ["/bin/bash", "-c"]
RUN curl -s "https://get.sdkman.io" | bash
RUN echo "source /home/${USERNAME}/.sdkman/bin/sdkman-init.sh" >> /home/${USERNAME}/.bashrc && \
    source "/home/${USERNAME}/.sdkman/bin/sdkman-init.sh" && \
    sdk install gradle
