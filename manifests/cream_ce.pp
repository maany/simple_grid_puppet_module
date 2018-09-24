class simple_grid::cream_ce (
  $site_level_config_file_path = lookup("simple_grid::site_level_config_file_path")
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
  
  # run the pre-conf.py script by giving the cream section of site-level-config file as input
  # start the container
}
