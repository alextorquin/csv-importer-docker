#
# This script will kick off the CSV importer as a web server, using Docker run.
# It will launch a web server on port 8081 that you can approach and use to import data.
#

#
# Create a personal access token in your Firefly III installation, under 'Profile'
#
PERSONAL_ACCESS_TOKEN=eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIzIiwianRpIjoiYzNmNTIwZjBhMzMzYzNjNDZkM2VlYTc2MzVlOTAxZGEwM2I1MWY1Nzc2NjE3ODczOTFjMzk5M2MzMTE2MzFlNjk5YjZhYzlkNzhmMjIzZWIiLCJpYXQiOjE2MTAzNzc4MTEsIm5iZiI6MTYxMDM3NzgxMSwiZXhwIjoxNjQxOTEzODExLCJzdWIiOiIxIiwic2NvcGVzIjpbXX0.KwBcNVXnNBSMsle09GpGd6U8FRALA99BvaOLDM9Z4irJ0X2uTH7aIFlzIWSlPeojZ1tzXJBouEn29LqYd3LWVYjY16bTFPuOUac3Rqg_o2ubyZFXGo8V8k_uL2q3BwRSILoIxhgKqyZKpESqjeXl9SOxdArqHE4BIO9AygLB3uYjF3i8pZaJjVQtmfMl4EbYDb2wVzGgGMIBj5ffFl0i3eZWM2huNm-mIBrd7kNeBOBMt0_30sKNc2BqMfJ4e4GPHCEpQutJirQyGaJ1wW65VgdJxH0-3W1u_Ydl7FbACbi134A05FkywZfnWPfSEJC4SMLf_Lzyg8RRCx-Yy7IxaS1xKYO0OplUF6SahZKIK2ZeR7wAYsbc5i3H4WZh1VqMnzk7avM-7JT_lt_Dfq6rbetlj0hh8UG35Cg5-u6pGUegJR4D8JXc8FYLZFWT9NmsPJcHGJGIosG6bz8jgq5NKm4j2D22eEA0SFs-jFLSQ22Oyfl9bAOfre-Zv4UwaRDejPhixmqY6Q1dR7__QPlL5mLozwcjbzyFCfsg0WHMUwMGICaXsYnBX4rzfQxQa5tkTk4FNNs-mndOKGRZmwXher33D5C161p8D-GOkvjaIX4AGzWP2RS8TY0P11Jh_qJZWGuD2DhZbJa9bcaOxtZDCskiFyXBpmd3yBmDIlg9SeA

#
# This is the full path to your Firefly III installation.
# Remove any trailing slashes, please!
#
FIREFLY_III_URL=http://127.0.0.1:8090

#
# There is no need to touch anything after this point, but if you're smart you're free to do so.
#

docker run \
--rm \
-e FIREFLY_III_ACCESS_TOKEN=$PERSONAL_ACCESS_TOKEN \
-e FIREFLY_III_URL=$FIREFLY_III_URL \
-p 8081:8080 \
fireflyiii/csv-importer:latest
