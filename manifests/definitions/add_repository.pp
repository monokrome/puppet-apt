define apt::add::repository ($identifier) {
	exec {
		"apt::add::repository::${name}":
			command => "apt-add-repository ${identifier}",
			notify => Exec["apt-update"],
			path => ["/sbin", "/bin",
			         "/usr/sbin", "/usr/bin",
			         "/usr/local/sbin", "/usr/local/bin"],
	}
}

