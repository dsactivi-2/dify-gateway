FROM nginx:1.27-alpine

# Remove default config
RUN rm /etc/nginx/conf.d/default.conf

# Copy template
COPY nginx.conf /etc/nginx/templates/default.conf.template

# Only substitute OUR variables, not nginx's $host/$remote_addr/etc
ENV NGINX_ENVSUBST_FILTER='^(API_HOST|API_PORT|WEB_HOST|WEB_PORT)$'

EXPOSE 80

# Default values (overridden by Railway env vars)
ENV API_HOST=api.railway.internal
ENV API_PORT=5001
ENV WEB_HOST=web.railway.internal
ENV WEB_PORT=3000
