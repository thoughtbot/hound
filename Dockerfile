# Use an official Node.js runtime as the base image
FROM node:20

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and yarn.lock to the working directory
COPY package.json yarn.lock ./

# Install Yarn globally (specific version)
RUN npm install -g yarn@1.22.17 --force

# Install dependencies using Yarn and clean up
RUN yarn install --frozen-lockfile && \
    yarn cache clean

# Copy the rest of the application code to the working directory
COPY . .

# Expose the port on which your application listens (if applicable)
# EXPOSE 3000

# Command to start your application
# CMD ["node", "app.js"]
