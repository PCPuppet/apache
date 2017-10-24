class apache {
	include apache::package
	include apache::config
	include apache::service
	
	#outline the order the modules will be executed
	# package, config, then service
	# ~> a notify will be triggered for service to run if the config module changes
	# this process of separating each module intent in it own manifest file is better than using one file for all configurations and using require, subscribe or notify

	Class['apache::package'] -> Class['apache::config'] ~> Class['apache::service']
}
