#!/bin/bash

echo "inside the container"

awslocal lambda list-functions

awslocal lambda create-function \
    --function-name localstack-lambda-url-example \
    --runtime nodejs18.x \
    --zip-file fileb://./setup/lambda.zip \
    --handler handler.handler \
    --role arn:aws:iam::000000000000:role/lambda-role


awslocal lambda invoke --function-name localstack-lambda-url-example \
    --payload '{"body": "{\"num1\": \"10\", \"num2\": \"10\"}" }' output.txt

tail -f /dev/null
