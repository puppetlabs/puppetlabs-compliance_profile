# About this Module

This module is an example of how to use the System Integrity Monitoring
Platform (SIMP) Puppet modules released by the National Security Agency (NSA).
In addition to the example profile, an example Puppetfile and Hiera data are also
provided.

# Getting Started

## Adding the Modules 
This repository contains an example Puppetfile that can
be used with Puppet Enterprise’s Code Manager application to pull in the NSA
and supporting Puppet modules.  Some of these modules will likely need
modification to work with your infrastructure, but most will not.

*Note*: For the following modules to work on a RHEL system, the Optional and
Supplementary repositories will have to be enabled.  CentOS systems do not need
additional channels.

Also note that the example Puppetfile pulls the modules directly from Github.
This is not ideal for production use for a few reasons: 

* Every code deploy with r10k will pull the latest commit on the master branch
  of the modules. This *will* lead to locally untested code being deployed 
* This requires the Puppet Master have outbound access to the Internet. For
  many environments, this is not possible or not allowed. 
  
We recommend you clone the git repositories to a local git repository with
access control or add it directory to your control repository in r10k.

## Adding the profile class 
You can either use this module directly or you can
copy it to your existing profile module. If you add it to an existing module,
remember to change the name of the class

This class will likely need customization for your particular use of Puppet.
Please note that since the NSA modules only support the Red Hat family of Linux
distributions, this example profile will also only work on Red Hat based
distros.

This class can be declared in the Puppet Enterprise Node Manager application
as part of a node group that contains all systems that need to adhere to
STIGs.  This profile can also be included as part of a role class using the
[roles and profiles pattern](https://docs.puppetlabs.com/pe/latest/puppet_assign_configurations.html#assigning-configuration-data-with-role-and-profile-modules).  To learn all the ways to assign classes in Puppet
Enterprise, refer to the [Puppet Labs documentation](https://docs.puppetlabs.com/pe/latest/puppet_assign_configurations.html#assigning-classes).  
 
## Site specific data

This module contains an example Hiera file under hieradata/common.yaml.  The
file outlines the options that should be set in order for your environment to
work.

## Managing users

The module provides a compliance::user defined type to manage system users in a
compliant way. The defined type does the following:

* Create the local user on the system.
* Create the user's home directory. You can turn this off.
* Enable the user to authenticate with PAM from the defined origins. The
  default is to allow any origin.
* Manage the user's RSA SSH keys, purging any keys that exist but are not
  managed by Puppet. It only supports RSA keys

Example:

    compliance::user { 'foo':
      home                   => '/mnt/home/foo',
      allowed_access_origins => ['192.168.1.0/24','1.2.3.4','5.6.7.8'],
      authorized_keys        => [
        'AAAAB3NzaC1yc2EAAAABIwAAAQEA6NF8iallvQVp22WDkTkyrtvp9eWW6A8YVr+kz4TjGYe7gHzIw+niNltGEFHzD8+v1I2YJ6oXevct1YeS0o9HZyN1Q9qgCgzUFtdOKLv6IedplqoPkcmF0aYet2PkEDo3MlTBckFXPITAMzF8dJSIFo9D8HfdOV0IAdx4O7PtixWKn5y2hMNG0zQPyUecp4pzC6kivAIhyfHilFR61RGL+GPXQ2MWZWFYbAGjyiYJnAmCP3NOTd0jMZEnDkbUvxhMmBYSdETk1rRgm+R4LOzFUGaHqHDLKLX+FIPKcF96hrucXzcWyLbIbEgE98OHlnVYCzRdK8jlqm8tehUc9c9WhQ==',
      ],
    }

Note the authorized SSH keys can be encrypted with [eyaml](https://puppetlabs.com/blog/encrypt-your-data-using-hiera-eyaml) as a parameter in Hiera for safe storage in version control.

# Compliance Coverage

## FIPS 
The Federal Information Processing Standards (FIPS) are standards
issued by the US federal government to establish system requirements for
interoperability and security.  

To use FIPS with the NSA modules, set the **use_fips** parameter in hiera to true.

    use_fips: true

This does a few things:
* Set the fips kernel parameter to 1
* Ensures the latest version of the dracut-fips and fipscheck package is installed
* The SSH client and server ciphers will be set to aes256-gcm@openssh.com and aes128-gcm@openssh.com
* The SSH client and server Message Authentication Codes (MACs) will be set to hmac-sha2-256 and hmac-sha1
* The SSH server Key Exchange (KEX) methods will be set to ecdh-sha2-nistp521, ecdh-sha2-nistp384, ecdh-sha2-nistp256, and diffie-hellman-group-exchange-sha256
* The only allowed TLS version for stunnel will be TLSv1
* The only allowed cipher for vsftpd will be FIPS
* If your processor supports Advanced Encryption Standard (AES), the dracut-fips-aesni package will be installed

## CCE and CVE Coverage

The following CCEs and CVEs are covered by the NSA modules

### CCEs
|||||
|-------------|-------------|-------------|-------------| 
| CCE-27222-9 | CCE-27024-9 | CCE-27135-3 | CCE-26610-6 | 
| CCE-26610-6 | CCE-27522-2 | CCE-27550-3 | CCE-27237-7 | 
| CCE-27238-5 | CCE-27241-9 | CCE-27239-3 | CCE-27522-2 | 
| CCE-26785-6 | CCE-26933-2 | CCE-27522-2 | CCE-27550-3 | 
| CCE-27237-7 | CCE-27238-5 | CCE-27241-9 | CCE-27239-3 | 
| CCE-26785-6 | CCE-26933-2 | CCE-27058-7 | CCE-26712-0 | 
| CCE-26651-0 | CCE-26280-8 | CCE-27173-4 | CCE-27174-2 | 
| CCE-27175-9 | CCE-27177-5 | CCE-27178-3 | CCE-27179-1 | 
| CCE-27180-9 | CCE-27181-7 | CCE-27182-5 | CCE-27183-3 | 
| CCE-27184-1 | CCE-27185-8 | CCE-26457-2 | CCE-26611-4 | 
| CCE-27172-6 | CCE-27203-9 | CCE-27169-2 | CCE-27170-0 | 
| CCE-27172-6 | CCE-26648-6 | CCE-26573-6 | CCE-26664-3 | 
| CCE-26657-7 | CCE-26691-6 | CCE-26610-6 | CCE-26662-7 | 
| CCE-26612-2 | CCE-26612-2 | CCE-18455-6 | CCE-4241-6  | 
| CCE-27070-2 | CCE-26917-5 | CCE-27031-4 | CCE-27033-0 | 
| CCE-27457-1 | CCE-27270-8 | CCE-26891-2 | CCE-26953-0 | 
| CCE-26856-5 | CCE-26868-0 | CCE-26947-2 | CCE-26967-0 | 
| CCE-26992-8 | CCE-27026-4 | CCE-26975-3 | CCE-26951-4 | 
| CCE-26822-7 | CCE-26930-8 | CCE-26954-8 | CCE-26974-6 | 
| CCE-27228-6 | CCE-26985-2 | CCE-27013-2 | CCE-26998-6 | 
| CCE-27002-5 | CCE-26371-5 | CCE-26763-3 | CCE-26340-0 | 
| CCE-26448-1 | CCE-26448-1 | CCE-26448-1 | CCE-26544-7 | 
| CCE-26800-3 | CCE-26361-6 | CCE-26670-0 | CCE-26239-4 | 
| CCE-26410-1 | CCE-26404-4 | CCE-26696-5 | CCE-26677-5 | 
| CCE-27016-5 | CCE-27221-1 | CCE-26917-5 | CCE-27044-7 | 
| CCE-27366-4 | CCE-27007-4 | CCE-26999-3 | CCE-27027-2 | 
| CCE-27037-1 | CCE-27066-0 | CCE-26979-5 | CCE-26854-0 | 
| CCE-27004-1 | CCE-27015-7 | CCE-26983-7 | CCE-26915-9 | 
| CCE-26831-8 | CCE-27001-7 | CCE-26883-9 | CCE-26993-6 | 
| CCE-27053-8 | CCE-27164-3 | CCE-27166-8 | CCE-3660-8  | 
| CCE-27222-9 | CCE-27024-9 | CCE-27135-3 | CCE-26610-6 | 
| CCE-26610-6 | CCE-27522-2 | CCE-27550-3 | CCE-27237-7 | 
| CCE-27238-5 | CCE-27241-9 | CCE-27239-3 | CCE-27522-2 | 
| CCE-26785-6 | CCE-26933-2 | CCE-27522-2 | CCE-27550-3 | 
| CCE-27237-7 | CCE-27238-5 | CCE-27241-9 | CCE-27239-3 | 
| CCE-26785-6 | CCE-26933-2 | CCE-27058-7 | CCE-26712-0 | 
| CCE-26651-0 | CCE-26280-8 | CCE-27173-4 | CCE-27174-2 | 
| CCE-27175-9 | CCE-27177-5 | CCE-27178-3 | CCE-27179-1 | 
| CCE-27180-9 | CCE-27181-7 | CCE-27182-5 | CCE-27183-3 | 
| CCE-27184-1 | CCE-27185-8 | CCE-26457-2 | CCE-26611-4 | 
| CCE-27172-6 | CCE-27203-9 | CCE-27169-2 | CCE-27170-0 | 
| CCE-27172-6 | CCE-26648-6 | CCE-26573-6 | CCE-26664-3 | 
| CCE-26657-7 | CCE-26691-6 | CCE-26610-6 | CCE-26662-7 | 
| CCE-26612-2 | CCE-26612-2 | CCE-18455-6 | CCE-4241-6  | 
| CCE-27070-2 | CCE-26917-5 | CCE-27031-4 | CCE-27033-0 | 
| CCE-27457-1 | CCE-27270-8 | CCE-26891-2 | CCE-26953-0 | 
| CCE-26856-5 | CCE-26868-0 | CCE-26947-2 | CCE-26967-0 | 
| CCE-26992-8 | CCE-27026-4 | CCE-26975-3 | CCE-26951-4 | 
| CCE-26822-7 | CCE-26930-8 | CCE-26954-8 | CCE-26974-6 | 
| CCE-27228-6 | CCE-26985-2 | CCE-27013-2 | CCE-26998-6 | 
| CCE-27002-5 | CCE-26371-5 | CCE-26763-3 | CCE-26340-0 | 
| CCE-26448-1 | CCE-26448-1 | CCE-26448-1 | CCE-26544-7 | 
| CCE-26800-3 | CCE-26361-6 | CCE-26670-0 | CCE-26239-4 | 
| CCE-26410-1 | CCE-26404-4 | CCE-26696-5 | CCE-26677-5 | 
| CCE-27016-5 | CCE-27221-1 | CCE-26917-5 | CCE-27044-7 | 
| CCE-27366-4 | CCE-27007-4 | CCE-26999-3 | CCE-27027-2 | 
| CCE-27037-1 | CCE-27066-0 | CCE-26979-5 | CCE-26854-0 | 
| CCE-27004-1 | CCE-27015-7 | CCE-26983-7 | CCE-26915-9 | 
| CCE-26831-8 | CCE-27001-7 | CCE-26883-9 | CCE-26993-6 | 
| CCE-27053-8 | CCE-27164-3 | CCE-27166-8 | CCE-3660-8  | 

### CVEs

|||||
|---------------|---------------|---------------|---------------| 
| CVE-2013-5211 | CVE-2013-5211 | CVE-2013-5211 | CVE-2013-5211 | 
| CVE-2014-3566 | CVE-2014-3566 | CVE-2014-3566 | CVE-2014-3566 | 
| CVE-2014-3566 | CVE-2014-3566 | CVE-2014-3566 | CVE-2015-1029 | 
| CVE-2014-3566 | CVE-2014-3566 |               |               | 

