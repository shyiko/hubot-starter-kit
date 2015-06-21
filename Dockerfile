FROM dock0/arch

RUN pacman -Syyu --noconfirm && \
    pacman-db-upgrade && \
    pacman -S --noconfirm make gcc nodejs npm phantomjs && \
    yes | pacman -Scc && \
    echo 'unsafe-perm = true' >> ~/.npmrc && \
    npm install -g coffee-script && \
    mkdir -p /opt/hubot

WORKDIR /opt/hubot

COPY package.json package.json
COPY scripts/ scripts/

RUN npm install --production

ENTRYPOINT ["npm", "start", "--"]
