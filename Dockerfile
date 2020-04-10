FROM google/dart

WORKDIR /app
ADD ./server/pubspec.* /app/
RUN pub get --no-precompile
ADD ./server /app/
RUN pub get --offline --no-precompile

WORKDIR /app
EXPOSE 80

ENTRYPOINT ["pub", "run", "aqueduct:aqueduct", "serve", "--port", "80"]