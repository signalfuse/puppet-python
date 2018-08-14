# Install python from homebrew.
#
# Usage:
#
#     include python
class python {
  include boxen::config
  include homebrew
  include homebrew::config
  include xquartz
  include python::config

  package { 'python':
    require => Class['xquartz']
  }

  package { 'python@2':
    require => Class['xquartz']
  }
  boxen::env_script { 'python':
    ensure   => 'absent',
    content  => '# noop',
  }

  file { "${boxen::config::envdir}/python.sh":
    ensure => absent,
  }
}
