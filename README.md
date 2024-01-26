
# SSL Certificate Generator Script

This script automates the process of generating SSL certificates using OpenSSL.

## Usage
    ./cert_generator.sh <domain-name>

The script requires a single argument: the domain name for which you want to generate the certificate.

### Description
When executed, the script performs the following steps:

- Generates a 2048-bit RSA private key.
- Creates a Certificate Signing
- Request (CSR) with customizable country, state, locality, organization, and email. 
- Self-signs the CSR with the private key to create a certificate.
- Copies the certificate and key to a specified output directory.

### Configuration
Before running the script, configure the following variables at the beginning of the script:

    COUNTRY: The two-letter country code.
    STATE: The full state name.
    LOCALITY: The city name.
    ORGANIZATION: The company or organization name.
    EMAIL: The contact email address.
    OUTPUT_DIR: The path to the directory where the certificate and key will be copied.

### Output
The script provides a clear, step-by-step status in a table format, indicating the success or failure of each action.

    Generating SSL certificate for example.lan
    --------------------------------------
    | Step                              | Status    |
    |-----------------------------------|-----------|
    | Generating private key            | OK
    |-----------------------------------|-----------|
    | Creating CSR                      | OK
    |-----------------------------------|-----------|
    | Signing the certificate           | OK
    |-----------------------------------|-----------|
    | Copying files to directory        | OK
    |-----------------------------------|-----------|
    Process completed for example.lan

### Notes
- Ensure that OpenSSL is installed and configured on your system.
- You must have write permissions to the `OUTPUT_DIR` for the script to successfully copy the certificate files.
- Make sure to replace the placeholder variables with actual values to match your environment before using this script.
---
This is free and unencumbered software released into the public domain.

Anyone is free to copy, modify, publish, use, compile, sell, or distribute this software, either in source code form or as a compiled binary, for any purpose, commercial or non-commercial, and by any means.

In jurisdictions that recognize copyright laws, the author or authors of this software dedicate any and all copyright interest in the software to the public domain. We make this dedication for the benefit of the public at large and to the detriment of our heirs and successors. We intend this dedication to be an overt act of relinquishment in perpetuity of all present and future rights to this software under copyright law.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
