# Use the official Node.js image as the base image
FROM node:20

# Set the working directory inside the container
WORKDIR /usr/src/app

# Copy the package.json and package-lock.json files
COPY package*.json ./

# Install the dependencies
RUN npm install --only=production

# Copy the rest of the application code
COPY . .

# Copy .env file
COPY .env .env

# Generate Prisma client
RUN npx prisma generate

# Build the TypeScript code
RUN npm run build

# Expose the port that the application will run on
EXPOSE 8080

# Start the application
CMD ["npm", "start"]
