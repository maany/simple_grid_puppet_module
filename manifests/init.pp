# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include simple
class simple_grid
	{
	file { '/root/test':
		ensure => present,
		content => "r10k check configuration",
	}
	#Class[simple::pre_conf] -> Class[simple::handle_repos] -> Class[simple::config_validate] -> Class[simple::config]
	#class{"simple::pre_conf":}
	#class{"simple::handle_repos":}
	#class{"simple::config":}
}
