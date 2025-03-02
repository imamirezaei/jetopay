
# Use official Node.js image as a base
FROM node:18-alpine AS builder

# Set working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json first to leverage caching
COPY package.json package-lock.json ./

# Install dependencies
RUN npm install --only=production

# Copy source code
COPY . .

# Build the application
RUN npm run build

# Use a smaller image for the final stage
FROM node:18-alpine

# Set working directory inside the container
WORKDIR /app

# Copy only necessary files from the builder stage
COPY --from=builder /app/package.json /app/package-lock.json ./
COPY --from=builder /app/dist ./dist
COPY --from=builder /app/node_modules ./node_modules

# Expose the port
ARG PORT=3000
ENV PORT=${PORT}
EXPOSE ${PORT}

# Command to run the application
CMD ["node", "dist/main.js"]

