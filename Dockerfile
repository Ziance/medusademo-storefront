FROM node:18.19-alpine as builder

# Set the working directory for all subsequent commands
WORKDIR /app/storefront

# Copy the package.json and yarn lock files to the working directory
COPY package.json .
COPY yarn.* .

# Install the dependencies
RUN yarn install

# Copy all files in the current directory (.) to the working directory in the container
COPY . .

RUN yarn run build

EXPOSE 8000

# Set the default command to run the application in development mode
ENTRYPOINT [ "yarn", "start"]