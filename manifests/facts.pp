# == Class: stash::facts
#
# Class to add some facts for stash. They have been added as an external fact because
# we do not want to distrubute these facts to all systems.
#
# === Parameters
#
# [*port*]
#   port that stash listens on.
# [*uri*]
#   ip that stash is listening on, defaults to localhost.
#
# === Examples
#
# class { 'stash::facts': }
#
class stash::facts(
  $ensure = 'present',
  $port   = '7990',
  $uri    = '127.0.0.1',
) {
  exec { 'Create facter directory':
    command => '/usr/bin/sudo mkdir -p /etc/facter/facts.d'
  } ->

  file { '/etc/facter/facts.d/stash_facts.rb':
    ensure  => $ensure,
    content => template('stash/facts.rb.erb'),
    mode    => '0500',
  }
}
