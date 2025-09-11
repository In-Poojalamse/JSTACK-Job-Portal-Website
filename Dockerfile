# Use official lightweight Nginx image to serve static files
FROM nginx:alpine

# Remove default Nginx website content
RUN rm -rf /usr/share/nginx/html/*

# Copy your entire website files into Nginx's html folder
COPY . /usr/share/nginx/html

# Expose port 10000 (Render expects this port)
EXPOSE 10000

# Modify Nginx default config to listen on port 10000 instead of 80
RUN sed -i 's/80/10000/' /etc/nginx/conf.d/default.conf

# Start Nginx in the foreground
CMD ["nginx", "-g", "daemon off;"]