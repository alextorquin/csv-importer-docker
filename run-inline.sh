#
# This script will kick off the CSV importer on the command line, using Docker run.
# After it has run, the container will be stopped and removed automatically.
# To configure this script, change the variables below to your liking.

#
# Create a personal access token in your Firefly III installation, under 'Profile'
#
PERSONAL_ACCESS_TOKEN=eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiMzU0ZGVjOWY0M2QyOWMyYTQ4ZmYwMDAzYzc5MTNkYzAwMjc2NjViNmM2MGMwZGUwM2IxNTVjODMyOGFiODlmODJlNGU2ZjhlODhkNzQzODYiLCJpYXQiOjE2MTAxNDk4OTYsIm5iZiI6MTYxMDE0OTg5NiwiZXhwIjoxNjQxNjg1ODk2LCJzdWIiOiIxIiwic2NvcGVzIjpbXX0.rHPrteWT8DjGeaNju6_qBL77-jX05I7KsrMzyEzFxF9qu5kpGdqE7P7ZCl992znZFr7Ngo3ToqzpmWgi-nDWmsRnnusAv5XORv7T3Vp4c52V81sZRvh-PuNb1dIwgl9YaQUTNsLuevZ1MTDDqKQhl1iKyJX-eMPK5n8eJn3waSx2wCX-mzFyNfC9wrN39Bz8HxuaH_p0RZjePr7HPIZzRx8dROpQWZtXaOPsNOW7uD06oUSVsPYXx0HECEbAqVlcDdSWdoPl-KqNrEBWKxFhr9VvAKBzvUCAKi0eMlL0WNAVqGEkcc_ucYIfFIYICmk2-qnTO2I3ldGi9Qki1O4M38hrNLKLOZNKKHpo3lCmq4aawqvG_NYsZ3iUEcAuADg_SbXzquvCsVtJUmjG4Ig4yEb-2b0pi_wtfaC8h23Q0TEMqtvxSDnFf0eLFfAipa0qb8ONNWa_FQ1vAYjAA4Csb7eDmUpPTqdt-djUICn-t_z_k77Bb2us_DGCxItkWCPBUKxVTTd7HJ87wb4ZMFzE-tcvGJxwrNzbwKrmNl4pEKtiYFixDJKhj0RaDix5IKdb48z_UeT9Yh3RtgHTfjdgiZz_KkrbtNQ3Yhu5pC64GwBctgYgd-O52A1lPTJRkqTXcW1GG49SUcRimR9yYclwcm6uvF2aDpfDp3DCsSrlHx0

#
# This is the full path to your Firefly III installation.
# Remove any trailing slashes, please!
#
FIREFLY_III_URL=http://192.168.1.70:8090

#
# There is no need to touch anything after this point, but if you're smart you're free to do so.
#
DIR=$PWD


echo "Link $DIR to /import"
docker run \
--rm \
-v $DIR:/import \
-e FIREFLY_III_ACCESS_TOKEN=$PERSONAL_ACCESS_TOKEN \
-e FIREFLY_III_URL=$FIREFLY_III_URL \
-e WEB_SERVER=false \
fireflyiii/csv-importer:latest
