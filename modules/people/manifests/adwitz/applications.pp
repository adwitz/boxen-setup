class people::adwitz::applications {
  include opera
  include redis

  # Download and Install Spotify

  $install_file = '/Applications/Install\ Spotify.app'
  package { 'Install Spotify':
    source   => 'http://download.spotify.com/SpotifyInstaller.zip',
    provider => 'compressed_app',
  }
  ~> exec { 'Install Spotify':
    command     => "/usr/bin/open ${install_file}",
    logoutput   => 'on_failure',
    refreshonly => true,
  }
  -> file { $install_file:
    ensure => 'absent',
  }

}
