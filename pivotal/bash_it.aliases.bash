# Link this file to ~/.bash_it/custom/aliases.bash
alias mr="cd ~/workspace/cf-mysql-release"
alias md="cd ~/workspace/cf-mysql-deployment"
alias pxc="cd ~/workspace/pxc-release"

alias gpc="git pair-commit"

alias rehash="hash -r"

alias dammit="bosh -n cleanup && bosh create release --force && bosh -n upload release"
function cfadminc ()
{
    environment=${1-fiji};
    source $HOME/workspace/dedicated-mysql-environments/scripts/bosh-env-vars ${environment};
    cf_admin_key=$(credhub find --name-like 'cf\_admin\_password' -j | jq -r .credentials[0].name);
    export CF_PASSWORD=$(credhub get -n "${cf_admin_key}" -j | jq -r .value);
    unset https_proxy;
    cf login -a api.${environment}.dedicated-mysql.cf-app.com --skip-ssl-validation -u admin -p ${CF_PASSWORD}
}
function funnelpw () {
    cf service-key funnelDB marco-desktop | tail +2 | jq -r '.password' | pbcopy
}
function funneltunnel () {
    cf api api.run.pivotal.io
    cf target -o dedicated-mysql-dev -s PM
    cf v3-ssh -N -L 63306:q-n8s3y1.q-g190.bosh:3306 funnel-api &
    cf service-key funnelDB marco-desktop | tail +2 | jq -r .password | pbcopy
}
function clickpointtunnel () {
    cf api api.run.pivotal.io
    cf target -o moragasystems -s prod
    cf v3-ssh -N -L 63306:q-n8s3y1.q-g173112.bosh:3306 clickpoint &
    cf service-key moragasysDB marco-cli | tail +2 | jq -r .password | pbcopy
}
function pws-vpn () {
    echo 'Instructions at: https://github.com/pivotal/pws-docs/blob/master/bosh-director-access-openvpn-ssoca.md'
    ssoca -e pws-prod auth login
    ssoca -e pws-prod openvpn exec --sudo &
    lpass show --clip --password 'Shared-PWS-mnicosia-Dropbox/PWS BOSH mnicosia'
    export BOSH_ENVIRONMENT=prod
    bosh -e prod login
}
