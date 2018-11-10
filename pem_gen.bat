mkdir .oci
.\\bin\openssl.exe genrsa -out ./.oci/oci_api_key.pem 2048
.\\bin\openssl.exe rsa -pubout -in ./.oci/oci_api_key.pem -out ./.oci/oci_api_key_public.pem
.\\bin\openssl.exe rsa -pubout -outform DER -in ./.oci/oci_api_key.pem | openssl md5 -c
.\\bin\openssl.exe rsa -pubout -outform DER -in ./.oci/oci_api_key.pem | openssl md5 -c > ./.oci/oci_api_key_fingerprint
REM copy the contents of bmcs_api_key_public.pem to the clipboard. 
cat ./.oci/oci_api_key_public.pem
