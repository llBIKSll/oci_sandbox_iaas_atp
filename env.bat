REM It clear User Variables on Windows Machine
REM Authentication details
setx TF_VAR_tenancy ""
setx TF_VAR_user ""
setx TF_VAR_fingerprint ""
setx TF_VAR_privatekeylocation ""

REM Deployement Region, what region to use
setx TF_VAR_region ""
REM eu-frankfurt-1, uk-london-1, us-ashburn-1, us-phoenix-1


REM Compartment, the compartment to use
setx TF_VAR_root_compartment_ocid ""
setx TF_VAR_compartment ""

REM Public/private keys used on the instance, the location
setx TF_VAR_ssh_public_key_path ""
setx TF_VAR_ssh_ssl_private_key_path ""


