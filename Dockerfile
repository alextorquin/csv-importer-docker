FROM jc5x/firefly-iii-base-image:latest

# To learn more about this base image, visit https://github.com/firefly-iii/docker-base-image

ARG version
ENV VERSION=$version

COPY entrypoint.sh /usr/local/bin/entrypoint.sh

LABEL version="1.2" maintainer="thegrumpydictator@gmail.com"

RUN curl -SL https://github.com/firefly-iii/csv-importer/archive/$VERSION.tar.gz | tar xzC $FIREFLY_III_PATH --strip-components 1 && \
    chmod -R 775 $FIREFLY_III_PATH/storage && \
    composer install --prefer-dist --no-dev --no-scripts --no-suggest && /usr/local/bin/finalize-image.sh

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
