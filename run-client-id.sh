#
# This script will kick off the CSV importer as a web server, using Docker run.
# It will launch a web server on port 8081 that you can approach and use to import data.
#

#
# Create a client ID in your Firefly III installation, under 'Profile'.
# Make sure you UNcheck the "confidential" checkbox.
#
CLIENT_ID=0

#
# This is the full path to your Firefly III installation:
#
FIREFLY_III_URI=http:/172.17.0.3/

#
# There is no need to touch anything after this point, but if you're smart you're free to do so.
#

docker run \
--rm \
-e FIREFLY_III_CLIENT_ID=$CLIENT_ID \
-e FIREFLY_III_URI=$FIREFLY_III_URI \
-p 8081:80 \
fireflyiii/csv-importer:latest
