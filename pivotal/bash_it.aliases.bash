# Link this file to ~/.bash_it/custom/aliases.bash
alias mr="cd ~/workspace/cf-mysql-release"
alias md="cd ~/workspace/cf-mysql-deployment"
alias pxc="cd ~/workspace/pxc-release"

alias gpc="git pair-commit"

alias gosri="bosh2 -e sriracha"
alias sshsri="gosri -d cf-mysql ssh --gw-user jumpbox --gw-host 35.193.197.242 --gw-private-key ~/.ssh/sriracha.id_rsa"
alias targetsri='(CF_CONFIG=$(find $HOME/workspace/core-services-oss-env-resource-pool -name sriracha); CF_VARS=$HOME/workspace/deployments-core-services/sriracha/cf-deployment-vars.yml; cf api $(jq -r "\"api.\" + .domain" $CF_CONFIG) --skip-ssl-validation; cf login -u admin -p $(bosh2 int --path /cf_admin_password $CF_VARS))'
alias srilogin='(cd $HOME/workspace/deployments-core-services/sriracha; git pull; bbl4 ssh-key > ~/.ssh/sriracha.id_rsa; chmod 600 ~/.ssh/sriracha.id_rsa; BOSH_CA_CERT=$(bbl4 director-ca-cert) bosh2 login --client=$(bbl4 director-username) --client-secret=$(bbl4 director-password) -e $(bbl4 director-address); BOSH_CA_CERT=$(bbl4 director-ca-cert) bosh2 -e $(bbl4 director-address) alias-env sriracha)'
alias dammit="bosh -n cleanup && bosh create release --force && bosh -n upload release"
alias sridammit="gosri -n clean-up && gosri create-release --force && gosri -n upload-release"
