*********************
Self Service Password
*********************

Presentation

Self Service Password is a PHP application that allows users to change their password in an LDAP directory.

The application can be used on standard LDAPv3 directories (OpenLDAP, OpenDS, ApacheDS, 389 DS, RHDS, Sun Oracle DSEE, Novell, etc.) and also on Active Directory.

It has the following features:

    Samba mode to change Samba passwords
    Active directory mode
    Local password policy:
        Minimum/maximum length
        Forbidden characters
        Upper, Lower, Digit or Special characters counters
        Reuse old password check
        Complexity (different class of characters)
    Help messages
    Reset by questions
    Reset by mail challenge (token sent by mail)
    Reset by SMS (through external Email 2 SMS service)
    reCAPTCHA (Google API)
    Mail notification after password change

Self Service Password code is now hosted on GitHub: https://github.com/ltb-project/self-service-password

Vote for this software: 18 likes
Documentation

    Latest release documentation
    All releases:
        Self Service Password v1.4
        Self Service Password v1.3
        Self Service Password v1.2
        Self Service Password v1.1
        Self Service Password v1.0
        Self Service Password v0.9
        Self Service Password v0.8
        Self Service Password v0.7
        Self Service Password v0.6
        Self Service Password v0.5
        Self Service Password v0.4
        Self Service Password v0.3

Screenshots
Version 1.0
ssp_1_0_change_password.png	ssp_1_0_reset_mail.png	ssp_1_0_reset_questions.png
ssp_1_0_reset_sms.png	ssp_1_0_set_questions.png	
From 0.6 to 0.9
recaptcha.png		
Versions 0.4 and 0.5
ssp_change_fulloptions.png	ssp_change_nooptions.png	ssp_resetbyquestions.png
ssp_resetbytokens.png	ssp_sendtoken.png	ssp_setquestions.png
Version 0.3
self_service_password.png	self_service_password_1266273082544.png	self_service_password_1266273139157.png
self_service_password_1266273215596.png	
