class simple_grid::cream_ce (
  $site_level_config_file_path = lookup("simple_grid::site_level_config_file_path"),
){
  notify{"Config file path: ${site_level_config_file_path}":}
  ## Actions to be performed on Puppet Master
  #access site level configuration file and
  # 1) pull repository_url
  # 2) version
  # 3) configuration parameters for cream
  # 4) Copy the config params to puppet agent

  # parse config schema

  ## Actions to be performed on puppet client
  # git clone the repo
  vcsrepo {"/etc/simple_grid/cream_ce":
    ensure      => present,
    provider    => git,
    source      => 'https://github.com/WLCG-Lightweight-Sites/wlcg_lightweight_site_ce_cream',
    revision    => master,
  }
  # run the pre-conf.py script by giving the cream section of site-level-config file as input
  # case, yaim, copy host certificates
  exec {"pre-configuration":
    logoutput => true,
    command   => '/usr/bin python /etc/simple_grid/cream_ce/yaim/pre-config.py', #pass site level configuration file
    cwd       => '/etc/simple_grid/cream_ce' 
  }
  
  # start the container
}
