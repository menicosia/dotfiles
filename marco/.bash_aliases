#
# Marco personal aliases. Sourced from ~/.bash_profile.  -- 2015/05/04
#
# alias ltc=~/bin/ltc
# alias tf=~/workspace/terraform/terraform
alias tf=~/bin/terraform/terraform
alias ls='ls -FCAs'
alias 0='cat > /dev/null'
alias cdc='clear ; cd'
alias sp='unset PROMPT_COMMAND; PS1="\A \u \h \w\$ "'
alias empty-tasks="curl -L http://192.168.11.11:4001/v2/keys/v1/task/?recursive=true -XDELETE"
alias mysql-relnotes="bundle exec rake changelog[/Users/pivotal/workspace/cf-mysql-release,v34,master,''] | sort -u | sed -E 's|(.*) \[details\].+/([[:digit:]]+).$|\1 \[[\#\2\]\(https://www.pivotaltracker.com/story/show/\2\)\]|'"
alias p-mysql-relnotes="bundle exec rake changelog[/Users/pivotal/workspace/p-mysql,v1.6.6,master,''] | sort -u | sed -E 's|(.*) \[details\].+/([[:digit:]]+).$|\1 \[[\#\2\]\(https://www.pivotaltracker.com/story/show/\2\)\]|'"
alias update-eagle-cert="scp ubuntu@pcf.eagle.wild.cf-app.com:/var/tempest/workspaces/default/root_ca_certificate ~/.ssh/eagle-root-ca.crt"
alias target-eagle="bosh --ca-cert ~/.ssh/eagle-root-ca.crt target 10.85.21.91 ; bosh -n download manifest \$(bosh deployments 2>/dev/null | awk -F \| '\$2 ~ /p-mysql/ {print \$2}') /tmp/eagle-mysql.yml ; bosh deployment /tmp/eagle-mysql.yml"
alias target-primo="bosh target bosh.primo.cf-app.com ; bosh -n download manifest cf-mysql /tmp/primo-mysql.yml ; bosh deployment /tmp/primo-mysql.yml"
alias primo-ssh="bosh ssh --gateway_host bosh.primo.cf-app.com --gateway_user vcap --gateway_identity_file ~/workspace/deployments-core-services/primo/keypair/id_rsa_bosh"
alias aws-ssh="bosh ssh --gateway_host 52.5.41.43 --gateway_user vcap --gateway_identity_file ~/.ssh/id_rsa_bosh"
alias ssh-fontina="ssh -Ai ~/.ssh/marco-pcf.pem pcf.fontina.cf-app.com -l ubuntu"
alias weekly-report="echo set TRACKER_SECRET_KEY; ./scripts/tracker_weekly_summary.rb 969486 254145 | pbcopy"
alias ccdb-tunnel="ssh -i ~/workspace/prod-keys/id_rsa_mnicosia -fN -L 63306:ccdb.clqg2e2w3ecf.us-east-1.rds.amazonaws.com:3306 mnicosia@jb.run.pivotal.io"
alias goprimo="bosh2 --ca-cert ~/workspace/deployments-core-services/primo/certs/rootCA.pem -e bosh.primo.cf-app.com"
alias sshprimo="goprimo -d cf-mysql ssh --gw-user vcap --gw-host=bosh.primo.cf-app.com --gw-private-key ~/workspace/deployments-core-services/primo/keypair/id_rsa_bosh"
alias godijon="bosh2 --ca-cert ~/workspace/deployments-core-services/dijon/certs/rootCA.pem -e bosh.dijon.cf-app.com"
alias sshdijon="goprimo -d cf-mysql ssh --gw-user vcap --gw-host=bosh.dijon.cf-app.com --gw-private-key ~/workspace/deployments-core-services/dijon/keypair/id_rsa_bosh"
alias goss="bosh2 --ca-cert ~/core-pm-bosh/oss/ossbosh.crt -e ossbosh"
alias gomornay="bosh2 -e mornay"
alias sshmornay="gomornay -d cf-mysql ssh --gw-user vcap --gw-host=bosh.mornay.cf-app.com --gw-private-key ~/core-pm-bosh/mornay/oss-bosh.key"

## https://www.iterm2.com/documentation-badges.html
itermbadge() {
  printf "\e]1337;SetBadgeFormat=%s\a" $(echo -n "$1" | base64)
}
