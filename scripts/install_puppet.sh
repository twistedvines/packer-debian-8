echo "Installing Puppet Agent..."
{
  PUPPET_RELEASE="puppetlabs-release-pc1-jessie.deb"
  wget http://apt.puppetlabs.com/$PUPPET_RELEASE
  dpkg -i $PUPPET_RELEASE
  apt-get update -y
  apt-get install -qq puppet-agent
  rm -r $PUPPET_RELEASE
} > /dev/null
