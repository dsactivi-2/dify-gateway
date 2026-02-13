FROM nginx:1.27-alpine

# Remove default config
RUN rm /etc/nginx/conf.d/default.conf

# Copy our template
COPY nginx.conf /etc/nginx/templates/default.conf.template

# Nginx will auto-substitute env vars from the template
# using envsubst on files in /etc/nginx/templates/

EXPOSE 8080

# Default values (overridden by Railway env vars)
ENV API_HOST=api.railway.internal
ENV API_PORT=5001
ENV WEB_HOST=web.railway.internal
ENV WEB_PORT=3000
