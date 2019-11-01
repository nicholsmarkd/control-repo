# /etc/puppetlabs/code/environments/production/modules/profile/manifests/hiera_test.pp
class profile::hiera_test (
  Boolean             $ssl,
  Boolean             $backups_enabled,
  Optional[String[1]] $site_alias = undef,
) {
  file { '/tmp/hiera_test.txt':
    ensure  => file,
    content => @("END"),
               Data from profile::hiera_test
               -----
               profile::hiera_test::ssl: ${ssl}
               profile::hiera_test::backups_enabled: ${backups_enabled}
               profile::hiera_test::site_alias: ${site_alias}
               |END
    owner   => root,
    mode    => '0644',
  }
  file { 'testfile':
    path => '/home/vagrant/output.txt',
    ensure => file,
    content => @(END),
        line1
        line2
        line3
        |END
    owner => root,
    mode => '0644',
  }
}
