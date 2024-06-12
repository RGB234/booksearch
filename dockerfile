# <references>
# https://github.com/edwardinubuntu/flutter-web-dockerfile/blob/master/Dockerfile
# https://blog.logrocket.com/containerizing-flutter-web-apps-with-docker/

# Stage 1 - Install dependencies and build the app
FROM debian:11.6 AS build-env

# Install flutter dependencies
RUN apt-get update 
RUN apt-get install -y curl git wget unzip libgconf-2-4 gdb libstdc++6 libglu1-mesa fonts-droid-fallback lib32stdc++6 python3
RUN apt-get clean
# Clone the flutter repo
RUN git clone https://github.com/flutter/flutter.git /usr/local/flutter

# RUN /usr/local/flutter/bin/flutter doctor -v

# setup the flutter path as an enviromental variable
ENV PATH="/usr/local/flutter/bin:/usr/local/flutter/bin/cache/dart-sdk/bin:${PATH}"

# Run flutter doctor
RUN flutter doctor -v
# Enable flutter web
RUN flutter channel master
RUN flutter upgrade
RUN flutter config --enable-web

# Copy files to container and build
RUN mkdir /app/
COPY . /app/
WORKDIR /app/

# environment variable
# pass the environment value(API_URL) when the image is built
# ARG API_URL
# ENV API_URL=${API_URL}
# RUN flutter build web --web-renderer html --dart-define K8SNODE_IP_ADDRESS=${API_URL:-"localhost"}

RUN flutter build web --web-renderer html

# Record the exposed port
EXPOSE 5000

# make server startup script executable and start the web server
RUN ["chmod", "+x", "/app/server/server.sh"]

ENTRYPOINT [ "/app/server/server.sh"]