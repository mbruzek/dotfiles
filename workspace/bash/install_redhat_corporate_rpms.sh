#!/bin/bash

# These repositiories are only available on the wired connections on site, or if you have the corporate VPN enabled.

sudo dnf install -y http://hdn.corp.redhat.com/rhel7-csb-stage/RPMS/noarch/linfo-0.2-4.el6.rhis.noarch.rpm

sudo dnf install -y http://hdn.corp.redhat.com/rhel7-csb-stage/RPMS/noarch/redhat-internal-sssd-config-0.3-7.el7.csb.noarch.rpm

sudo dnf install -y http://hdn.corp.redhat.com/rhel7-csb-stage/RPMS/noarch/redhat-internal-cert-install-0.1-7.el7.csb.noarch.rpm

sudo dnf install -y http://hdn.corp.redhat.com/rhel7-csb-stage/RPMS/noarch/redhat-internal-NetworkManager-openvpn-profiles-0.1-29.el7.csb.noarch.rpm

sudo dnf install -y http://hdn.corp.redhat.com/rhel7-csb-stage/RPMS/noarch/redhat-internal-ddns-client-1.3-10.el7.csb.noarch.rpm