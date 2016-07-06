#!/bin/bash
{
  echo 'vagrant ALL=(ALL) NOPASSWD:ALL' > /etc/sudoers.d/vagrant
  chmod 440 /etc/sudoers.d/vagrant

  echo "Defaults !requiretty" >> /etc/sudoers
} > /dev/null 2>&1
