# Builder
# This section defines a build stage named "builder" using the Node.js 16.17.0 image as the base image.
FROM node:16.17.0 as builder

# Set the working directory to /src inside the container.
WORKDIR /src

# Copy the entire content of the current directory (the context) into the /src directory of the container.
COPY . /src

# App
# This section starts defining the main application stage.

# Change the current directory to /src within the container. Note that the following commands will be executed in this directory.
RUN cd /src

# Install project dependencies using npm. The dependencies are typically defined in the project's package.json file.
RUN npm install

# Create an environment variable file (.env) with the content "SESSION_SECRET=abc123".
RUN echo "SESSION_SECRET=abc123" > .env

# Build the project using the defined build script (e.g., specified in package.json).
RUN npm run build

# Define the command that should be executed when the container starts.
# In this case, it starts the application using "npm start."
CMD npm start
