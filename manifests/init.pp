class apt {
	import "definitions/*.pp"

	exec {
		"apt-update":
			command => "apt-get update",
			path => ["/sbin", "/bin",
			         "/usr/sbin", "/usr/bin",
				"/usr/local/sbin", "/usr/local/bin"],
	}

	exec {
		"apt-upgrade":
			command => "apt-get -y upgrade",
			subscribe => Exec["apt-update"],
			refreshonly => true,
			path => ["/sbin", "/bin",
			         "/usr/sbin", "/usr/bin",
				"/usr/local/sbin", "/usr/local/bin"],
	}
}

