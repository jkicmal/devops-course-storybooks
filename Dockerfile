# Use this package as os
FROM node:14-slim

# Set working directory
WORKDIR /usr/src/app

# Copy package.json files to working directory
# This is usefull due to docker caching functionality
# [How? Why?]
COPY ./package*.json ./

# Install dependencies
# [Why run instad of CMD?]
RUN npm install

# Copy rest of source code to working directory
COPY . . 

# Set non-sudo user [Why?]
USER node

# Expose that port
EXPOSE 3000

# Run command in container shell
# [Why CMD instead of RUN?]
CMD ["npm", "start"]