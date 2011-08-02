define apt::add::repository ($identifier) {
	$identifier_file_format = regsubst(regsubst("${identifier}", "ppa:", ""), '\W', "-", "G")
	$created_filename = "/etc/apt/sources.list.d/${identifier_file_format}-${lsbdistcodename}.list"

	exec {
		"apt::add::repository::${name}":
			command => "apt-add-repository ${identifier}",
			notify => Exec["apt-update"],
			creates => "${created_filename}",
			path => ["/sbin", "/bin",
			         "/usr/sbin", "/usr/bin",
			         "/usr/local/sbin", "/usr/local/bin"],
	}
}

