## requirements
- enable SingleSingOn for HomeAssistant
- base plan is to integrate with Azure AD - OpenID Connect protocol

## SOLUTION
- SSL termination is done by nginx
- temporary solution with facebook login
- shared cookie to be able to use SSO with other application (new setup OauthProxy instance) (TBD: need to build and test)

## how to run
- generate certificate for nginx doc/cert/generate-cert.sh (TBD: need to automate with certbot?)
- run docker/home-assistant/home-assistant-run.sh for example `sh home-assistant-run.sh` from current folder
- 

![](SSO.png)