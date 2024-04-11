# Use an official Node.js runtime as the base image
FROM node:20

# Install Ruby, essential build tools, Bundler, and rbenv
RUN apt-get update && \
    apt-get install -y ruby-full build-essential rbenv && \
    gem install bundler:2.5.6 && \
    rbenv install 3.1.2 && \
    rbenv global 3.1.2 && \
    gem install hound -v '0.3.0' && \
    gem install hound-cli && \
    apt-get install -y docker.io && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Set the working directory inside the container
WORKDIR /app

# Copy package.json, yarn.lock, Gemfile, and Gemfile.lock to the working directory
COPY package.json yarn.lock Gemfile Gemfile.lock ./

RUN npm install --frozen-lockfile --legacy-peer-deps && \
    yarn cache clean

# Install Ruby dependencies using Bundler
RUN bundle install

# Copy .hound.yml configuration file
COPY .hound.yml ./

# Copy the rest of the application code to the working directory
COPY . .

# Expose the port on which your application listens (if applicable)
# EXPOSE 3000

# Command to start your application
# CMD ["node", "app.js"]
