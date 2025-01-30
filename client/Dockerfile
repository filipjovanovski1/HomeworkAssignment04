# Stage 1: Build the React application
FROM node:16 AS build
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code
COPY . ./

# Build the React app
RUN npm run build

# Stage 2: Serve the React build with NGINX
FROM nginx:alpine
COPY --from=build /app/build /usr/share/nginx/html

# Expose NGINX port
EXPOSE 80

# Run NGINX in the foreground
CMD ["nginx", "-g", "daemon off;"]
