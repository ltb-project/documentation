*******************************
Account expiration mail warning
*******************************

Presentation

This script will browse the LDAP directory a look for entries that uses password policy. If the user's password will expire soon, a mail is sent. It was only tested with OpenLDAP (ppolicy overlay).

This shell script must be run as a cronjob. You can run it daily.

It requires :

    gawk (GNU awk)
    ldapsearch
    mailx
    date

It was tested for GNU/Linux and SunOS 5.8.
Usage

There is no command line parameter:

sh checkLdapPwdExpiration.sh

Logs are sent through STDOUT and STDERR:

sh checkLdapPwdExpiration.sh 1>result.log 2>audit.log

Sample log files:

    result.log

--- Statistics ---
Users checked: 5
Account expired: 1
Account in warning: 1

    audit.log

No password policy for coudot
Password expired for sbahloul
No password change date for tchemineau
No password change date for rouazana
Mail sent to user farmand (farmand@example.com)

Configuration

Edit the script to adapt configuration:

    MY_LDAP_HOSTURI: LDAP URI
    MY_LDAP_ROOTDN (optional): DN to use to bind. No DN means anonymous
    MY_LDAP_ROOTPW: Password
    MY_LDAP_DEFAULTPWDPOLICYDN: Default password policy DN. Do not set if no default policy is used. In this case, the script will ony affect users with password policy in their entry (pwdPolicySubentry)
    MY_LDAP_SEARCHBASE: Users search base
    MY_LDAP_SEARCHFILTER: Users search filter
    MY_LDAP_SEARCHBIN: Path to ldapsearch binary
    MY_MAIL_DELAY: Time before expiration where a mail is sent. No mail sent after expiration. If no value, the script will take the pwdExpireWarning of the password policy
    MY_LDAP_NAME_ATTR: attribute containing user's name
    MY_LDAP_LOGIN_ATTR: attribute containing user's login
    MY_LDAP_MAIL_ATTR:attribute containing user's name
    MY_MAIL_BODY: message body
    MY_MAIL_SUBJECT: message subject
    MY_MAIL_BIN: mail binary
    MY_LOG_HEADER: log header
    MY_GAWK_BIN: path to gawk binary

Mail content: you can edit MY_MAIL_BODY and use the following variables:

    name
    login
    expireTimeTZ
    expireDays
    pwdMinLength
    pwdInHistory

Date localization: you can change the lang by modifying this line:

export LC_ALL=en_US.UTF-8


