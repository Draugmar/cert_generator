#!/bin/bash

# Configuration variables
COUNTRY="CountryCode" # Replace with the two-letter country code
STATE="State"         # Replace with the full state name
LOCALITY="City"       # Replace with the city name
ORGANIZATION="OrganizationName" # Replace with the organization name
EMAIL="email@example.com"       # Replace with the contact email address
OUTPUT_DIR="/path/to/output/directory" # Replace with the path to your output directory

# Check if a domain name was provided
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <domain-name>"
    exit 1
fi

DOMAIN=$1

echo "Generating SSL certificate for $DOMAIN"
echo "--------------------------------------"
echo "| Step                              | Status    |"
echo "|-----------------------------------|-----------|"

# Generate private key
echo -n "| Generating private key           | "
openssl genrsa -out "$DOMAIN.key" 2048 &> /dev/null && echo "OK" || echo "FAILED"
echo "|-----------------------------------|-----------|"

# Generate certificate signing request (CSR)
echo -n "| Creating CSR                      | "
openssl req -new -key "$DOMAIN.key" -out "$DOMAIN.csr" \
    -subj "/C=$COUNTRY/ST=$STATE/L=$LOCALITY/O=$ORGANIZATION/CN=$DOMAIN/emailAddress=$EMAIL" &> /dev/null && echo "OK" || echo "FAILED"
echo "|-----------------------------------|-----------|"

# Sign the certificate
echo -n "| Signing the certificate          | "
openssl x509 -req -days 365 -in "$DOMAIN.csr" -signkey "$DOMAIN.key" -out "$DOMAIN.crt" &> /dev/null && echo "OK" || echo "FAILED"
echo "|-----------------------------------|-----------|"

# Copy certificate and key to the desired directory
echo -n "| Copying files to directory       | "
cp "$DOMAIN.crt" "$OUTPUT_DIR/" &&
cp "$DOMAIN.key" "$OUTPUT_DIR/" && echo "OK" || echo "FAILED"
echo "|-----------------------------------|-----------|"

echo "Process completed for $DOMAIN"
