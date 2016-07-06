#!/bin/bash

export PUPPET_BIN="/opt/puppetlabs/puppet/bin/puppet"

# $@ - array of all puppet modules to install.
function install_modules {
  for MODULE in $@; do
    echo "Installing ${MODULE}..."
    MODULE_INSTALL_RESULT=`${PUPPET_BIN} module install ${MODULE}`
    if [[ $? -eq 0 ]]; then
      echo "puppet module ${MODULE} installed."
    else
      echo "puppet module ${MODULE} did not install, here's why:"
      echo $MODULE_INSTALL_RESULT
    fi
  done
}


echo "Installing Puppet Agent..."
{
  PUPPET_RELEASE="puppetlabs-release-pc1-jessie.deb"
  wget http://apt.puppetlabs.com/$PUPPET_RELEASE
  dpkg -i $PUPPET_RELEASE
  apt-get update -y
  apt-get install -qq puppet-agent
  rm -r $PUPPET_RELEASE
} > /dev/null 2>&1

echo "Testing Puppet has been installed correctly..."
{
  PUPPET_OUTPUT=`${PUPPET_BIN} --version`
  if [[ $? -eq 0 ]]; then
    echo "All good! you're rolling with version ${PUPPET_OUTPUT}."
  else
    echo "Something must have gone wrong, here's the output:"
    echo $PUPPET_OUTPUT
  fi
}
