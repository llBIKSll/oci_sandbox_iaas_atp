Guide - CSM Quick-Start
=======================

*Deploy a basic setup for an Application using ATP*

This guide helps you to deploy a setup below service for your customer.
The setup is a sandbox environment; it is not recommended for
production.

Services

\-         Autonomous Transaction Processing

\-          IaaS

Components

\-          1 x Bastion Host, with SSH access

\-          2 x Load balancer

\-          1 x App Server

\-          1 x Automouse Transaction Processing

\-          1 x Service Gateway

\-          1 x Object Store

\-          1x NAT Gateway

Overview 
---------

![](./media/image1.png)

**Use full Links**

[Learn more about IaC and
Terraform](file:///C:\confluence\display\ECSP\IaC+and+Terraform)

How to use the Terraform recipe
-------------------------------

The commands in this guide based on Windows machine. There are some
requirements that you need to fulfil before you start.

### Requirements

You will need to have Terraform install to be able to execute the
Terraform files. Access to tenant with a use that is member of the
Administrator group. The user need have API key in place. A compartment
is need to host the services.

**Terraform**\
You need Terraform installed on your machine.\
If don't have it then follow this guide -
<https://www.terraform.io/intro/getting-started/install.html>

**User\
**User with the right access and a API Key will be generated doing the
this guide

**Information needed**\
Please be sure that you have collected below information before you
start executing. If you do not all the need information, then execution
will fail.\
**tenancy\_ocid:** ex. 
\"ocid1.tenancy.oc1..aaaaaaaa3pi2x5yqidqenk4ybimduwxvmlwcuxuetz7k3iuini4jjlmmy36q\"\
**user\_ocid:** ex.
\"ocid1.user.oc1..aaaaaaaa7ael4fy6ox4zmjyjqvy5qb4sv5wfmkicr4no3yundyk7w57k5x7a\"\
**region:** ex. \"uk-london-1\" or \"eu-frankfurt-1\"

Get started
-----------

Now that the requirements are fulfil.

1.  Download the zip file that has all the need files for deployment.
    From: [Release](file:///C:\confluence\display\ECSP\Release) 

2.  Create a new folder fx.  C:\\customer\\sandbox\_awd\_atp\_a

3.  Extract the zip into this new folder.\
    ![C:\\07b791e27c7581a282b01eca3e596658](./media/image2.png)

4.  Open Windows Command Prompt (Window key + r \> Run cmd.exe)\
    ![C:\\7d474913a43254fc095edc538796c679](./media/image3.png)

5.  Add the API key to OCI user that is part of the Administrator group
    on OCI

6.  Go to Users in the OCI console. Menu \> Identity \> Users\
    ![C:\\3fce9e846e102d4aa181718c964ef641](./media/image4.png)

7.  Create a new user, Create User\
    ![C:\\d822b51b4d1aaed340b1b58323a0ba33](./media/image5.png)

8.  Provide a name and description for the new user\
    ![C:\\d7323cc2c7e7e9db802cac601e917eb5](./media/image6.png)

9.  Open the user, press the name\
    ![C:\\dced545f479e58f5040179a58e2156ea](./media/image7.png)

10. Add a new API key; press Add Public Key\
    ![C:\\0a19dbae392e97fb3fca19d16e6e5f26](./media/image8.png)

11. Past the public key content into the window.  You can get the
    content my run this command in the open command prompt; notepad
    ./.oci/oci\_api\_key\_public.pem\
    ![C:\\ddfb56b1846a9f65520b72ea6ce990a1](./media/image9.png)
    ![C:\\388b4520be0dd1a4f98a6aa7e80e67da](./media/image10.png)
    ![C:\\f30615b9cf245db9b914a3d7703dccc9](./media/image11.png)

12. Add the user to the Administrator group. Press Identity \> Groups \>
    Administartors\> Add User to Group \> Select the user from the
    drop-down\
    ![C:\\a34720add778abf9d843e0fbdb04ded1](./media/image12.png)\
    ![C:\\34fe94a314af546102e44dcf73e7a517](./media/image13.png)\
    ![C:\\5e32f76d0b9dc9491a4ed64eecdd0eab](./media/image14.png)\
    ![C:\\28419f754dc7d3080c26ef89cf35615b](./media/image15.png)

13. Now the next step to execute the Terraform setup

14. Go back to the Command Prompt

15. Run 'Terraform init'\
    ![C:\\13541c016d6c0598d49e1a274dc98f89](./media/image16.png)

16. Now Run 'Terraform plan' and provide the needed information doing
    the execution.\
    ![C:\\463a0a01a9540b6639c93a84aa3cf682](./media/image17.png)

17. Run 'Terraform applies' and provide the needed information doing the
    execution.\
    ![C:\\eb0f298991df5e4f7ce5c3284f9797a4](./media/image18.png)

18. Please confirm it by type 'yes'\
    ![C:\\3d092145beccfe5ed091469890e0908b](./media/image19.png)

19. Terraform will now apply the configuration to OCI\
    ![C:\\8fb1e28457552a627de9a2f7c7f1266c](./media/image20.png)

20. In the end, you will get the output listed on the screen\
    ![C:\\93c3b636d44a1ae37904244fde6eaf85](./media/image21.png)

21. Now the deployment is done, and you can go the OCI console to check
    how it looks\
    ![C:\\212c08ed927bb2912189267184b3a8c0](./media/image22.png)
    ![C:\\535898bcb10f1fb2be66a7e86e6162f8](./media/image23.png)
    ![C:\\33b1607ae9c8e25c8d42a3ec5ec5b13f](./media/image24.png)
