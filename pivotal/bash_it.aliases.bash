# Link this file to ~/.bash_it/custom/aliases.bash
alias mr="cd ~/workspace/cf-mysql-release"
alias md="cd ~/workspace/cf-mysql-deployment"
alias pxc="cd ~/workspace/pxc-release"

alias gpc="git pair-commit"

alias gosri="bosh -e sriracha"
alias sshsri="gosri -d cf-mysql ssh --gw-user jumpbox --gw-host 35.193.197.242 --gw-private-key ~/.ssh/sriracha.id_rsa"
function targetsri ()
{
    environment=${1-sriracha} ;
    CF_CONFIG=$(find $HOME/workspace/core-services-oss-env-resource-pool -name $environment) ;
    CF_VARS=$HOME/workspace/deployments-core-services/sriracha/cf-deployment-vars.yml ;
    cf api $(jq -r "\"api.\" + .domain" $CF_CONFIG) --skip-ssl-validation ;
    cf login -u admin-p $(bosh int --path /cf_admin_password $CF_VARS) ;
}
#alias targetsri='(CF_CONFIG=$(find $HOME/workspace/core-services-oss-env-resource-pool -name sriracha); CF_VARS=$HOME/workspace/deployments-core-services/sriracha/cf-deployment-vars.yml; cf api $(jq -r "\"api.\" + .domain" $CF_CONFIG) --skip-ssl-validation; cf login -u admin -p $(bosh int --path /cf_admin_password $CF_VARS))'
alias srilogin='(cd $HOME/workspace/deployments-core-services/sriracha; git pull; bbl4 ssh-key > ~/.ssh/sriracha.id_rsa; chmod 600 ~/.ssh/sriracha.id_rsa; BOSH_CA_CERT=$(bbl4 director-ca-cert) bosh login --client=$(bbl4 director-username) --client-secret=$(bbl4 director-password) -e $(bbl4 director-address); BOSH_CA_CERT=$(bbl4 director-ca-cert) bosh -e $(bbl4 director-address) alias-env sriracha)'
alias dammit="bosh -n cleanup && bosh create release --force && bosh -n upload release"
alias sridammit="gosri -n clean-up && gosri create-release --force && gosri -n upload-release"
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
    cf target -o pcf-mysql-product -s PM
    cf ssh -N -L 63306:q-n8s3y1.q-g190.bosh:3306 funnel-api &
    cf service-key funnelDB marco-desktop | tail +2 | jq -r .password | pbcopy
}
function pws-vpn () {
    echo 'Instructions at: https://github.com/pivotal-cloudops/cloudops-docs/blob/master/bosh-director-access-openvpn-ssoca.md'
    ssoca -e pws-prod openvpn exec --sudo &
    lpass show --clip --password 'Shared-PWS-mnicosia-Dropbox/PWS BOSH mnicosia'
    bosh -e prod login
}
