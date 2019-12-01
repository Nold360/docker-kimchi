nold360/docker-kimchi
===============

**This image might not build, i tried running kimchi in a container but it's just a pain in the a..**
Don't use me! Just uploaded this for documentation/sharing.

(broken) docker image for kimchi. 
 - The App depends hardly on systemd, which sucks for containers
 - The App seems to use the PAM-Stack for authenticaton? ^
 - The App does not allow listening on 0.0.0.0 without patching the code
 - When running, it requires to access 3rd-party web services to import javascript code - ewwww
