#!/usr/bin/env bash

# Source the optparse.bash file ---------------------------------------------------
source /usr/local/bin/optparse.bash

# Define options
optparse.define short=x long=directory-prefix desc="Destination directory to save all files" variable=directory file=true required=true
optparse.define short=D long=domains desc="Set coma separated domains to be follow" variable=domains
optparse.define short=h long=no-check-certificate desc="Don't check the server certificate." variable=check_certificate value=true default=false
optparse.define short=H long=span-hosts desc="Enable spanning across hosts." variable=span value=true default=false
optparse.define short=E long=adjust-extension desc="Convert files to html extension." variable=extension value=true default=false
optparse.define short=k long=convert-links desc="Convert links for local viewing." variable=convert value=true default=false
optparse.define short=p long=page-requisites desc="Download all necessary page files." variable=requisites value=true default=false
optparse.define short=s long=restrict-file-names desc="Acceptable values for file names." variable=names list="windows unix nocontrol"
optparse.define short=r long=recursive desc="Turn on recursive retrieving." variable=recursive value=true default=false required=true
optparse.define short=c long=continue desc="Resume getting a partially-downloaded file." variable=continue value=true default=false
optparse.define short=t long=no-parent desc="Do not ever ascend to the parent directory" variable=no_parent value=true default=false required=true
optparse.define short=d long=progress desc="Progress indicator you wish to use." variable=progress list="bar dot"
optparse.define short=U long=user-agent desc="Identify as agent-string to the HTTP server." variable=agent list="Mozilla"
optparse.define short=l long=level desc="Recursion maximum depth level." variable=level
optparse.define short=u long=user desc="Proxy user to use" variable=user
optparse.define short=w long=password desc="Proxy password to use." variable=password
optparse.define short=e long=http-user desc="Http user to login to site" variable=http_user
optparse.define short=a long=http-password desc="Http password to login to site." variable=http_password
optparse.define short=j long=reject desc="Comma-separated file name list to reject." variable=reject

# Generate optparse and autocompletion scripts
script_name="wget_site.sh"
optparse.build $script_name

exit 0

