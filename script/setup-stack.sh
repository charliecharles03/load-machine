#!/bin/bash

echo "inside the container"

awslocal lambda list-functions

awslocal lambda create-function \
    --function-name localstack-lambda-url-example \
    --runtime nodejs18.x \
    --zip-file fileb://./setup/lambda.zip \
    --handler index.handler \
    --role arn:aws:iam::000000000000:role/lambda-role

tail -f /dev/null
