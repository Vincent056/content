#!/bin/bash
# packages = audit

{{% if product == "ol8" %}}
OTHER_FILTERS_EUID=" -C uid!=euid"
OTHER_FILTERS_EGID=" -C gid!=egid"
{{% else %}}
OTHER_FILTERS_EUID=" -C uid!=euid -F euid=0"
OTHER_FILTERS_EGID=" -C gid!=egid -F egid=0"
{{% endif %}}

echo "-a never,exit -F arch=b32 -S execve${OTHER_FILTERS_EGID} -k setgid" > /etc/audit/audit.rules
echo "-a never,exit -F arch=b64 -S execve${OTHER_FILTERS_EGID} -k setgid" >> /etc/audit/audit.rules
echo "-a never,exit -F arch=b32 -S execve${OTHER_FILTERS_EUID} -k setuid" >> /etc/audit/audit.rules
echo "-a never,exit -F arch=b64 -S execve${OTHER_FILTERS_EUID} -k setuid" >> /etc/audit/audit.rules
