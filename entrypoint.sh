#!/bin/bash

echo "Now in entrypoint.sh (v1.4) (2020-09-23) for Firefly III [tool] importer."
echo "Please wait for the container to start..."

echo "Dump auto load..."
composer dump-autoload > /dev/null 2>&1
echo "Discover packages..."
php artisan package:discover > /dev/null 2>&1

php artisan cache:clear > /dev/null 2>&1
php artisan config:clear > /dev/null 2>&1
php artisan config:cache > /dev/null 2>&1

# set docker var.
export IS_DOCKER=true

php artisan importer:version



if [ -z $APACHE_RUN_USER ]
then
      APACHE_RUN_USER='www-data'
fi

if [ -z $APACHE_RUN_GROUP ]
then
      APACHE_RUN_GROUP='www-data'
fi

rm -f $FIREFLY_III_PATH/storage/framework/cache/data/*
rm -f $FIREFLY_III_PATH/storage/logs/*.log
chown -R $APACHE_RUN_USER:$APACHE_RUN_GROUP $FIREFLY_III_PATH/storage
chmod -R 775 $FIREFLY_III_PATH/storage

if [ "$WEB_SERVER" == "false" ]; then
	echo "Will launch auto import on /import directory."
	php artisan importer:auto-import /import
else
	echo "Will now run Apache web server:"
	exec apache2-foreground
fi
