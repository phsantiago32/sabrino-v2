FROM alpine

# Install dependencies
RUN apk update && apk upgrade \
  && apk add --update nodejs nodejs-npm \
  && npm install -g npm 
 
# Create hubot user
RUN adduser -h /hubot -s /bin/bash -S hubot
USER  hubot
WORKDIR /hubot

# Copy dependency files and install with npm
COPY package.json package.json
RUN npm install

# Copy bot scripts
COPY scripts /hubot/scripts
COPY external-scripts.json external-scripts.json
COPY run.sh run.sh

# Copy application file
ADD bin/hubot bin/

RUN ls /hubot

# Let's get it started!
CMD ["/bin/sh", "-c", "./run.sh"]