#!/usr/bin/env bash

declare city
declare api_url

echo 'Please enter the city: '
read -r city

api_url='https://downloads.codingcoursestv.eu/055%20-%20bash/api/api.php'

result="$(curl "${api_url}" -G --data-urlencode "city=${city}" --silent | jq '.temperature')"

echo "In ${city}, temperature is: ${result}°C"