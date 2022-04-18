FROM node:12.12

# Create app directory
WORKDIR /usr/src/gitbook

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json ./

RUN npm install
# If you are building your code for production
# RUN npm ci --only=production

# If there is any extra gitbook plugin
RUN node_modules/.bin/gitbook install

# Bundle app source
COPY . .
EXPOSE 4000
CMD [ "node_modules/.bin/gitbook", "serve" ]