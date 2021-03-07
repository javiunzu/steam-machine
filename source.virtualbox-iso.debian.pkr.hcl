source "virtualbox-iso" "debian" {
  boot_command            = ["<esc><wait>", "install <wait>", "preseed/url=http://{{ .HTTPIP }}:{{ .HTTPPort }}/preseed.cfg <wait>", "debian-installer=en_US <wait>", "auto <wait>", "locale=en_US <wait>", "kbd-chooser/method=us <wait>", "keyboard-configuration/xkb-keymap=es <wait>", "netcfg/get_hostname={{ .Name }} <wait>", "netcfg/get_domain=${var.domain} <wait>", "fb=false <wait>", "debconf/frontend=noninteractive <wait>", "console-setup/ask_detect=false <wait>", "console-keymaps-at/keymap=us <wait>", "passwd/username=${var.username} <wait>", "passwd/user-password=${var.password} <wait>", "passwd/user-password-again=${var.password} <wait>", "<enter><wait>"]
  boot_wait               = "10s"
  disk_size               = 20480
  guest_additions_path    = "VBoxGuestAdditions_{{.Version}}.iso"
  guest_os_type           = "Debian_64"
  headless                = true
  http_directory          = "http"
  iso_checksum            = "file:http://cdimage.debian.org/cdimage/release/${var.debian_version}/amd64/iso-cd/SHA512SUMS"
  iso_url                 = "http://cdimage.debian.org/cdimage/release/${var.debian_version}/amd64/iso-cd/debian-${var.debian_version}-amd64-netinst.iso"
  keep_registered         = true
  shutdown_command        = "echo '${var.password}'|sudo -S /sbin/shutdown -hP now"
  skip_export             = true
  ssh_password            = "${var.password}"
  ssh_port                = 22
  ssh_username            = "${var.username}"
  ssh_wait_timeout        = "10000s"
  vboxmanage              = [["modifyvm", "{{.Name}}", "--memory", "4096"], ["modifyvm", "{{.Name}}", "--cpus", "4"], ["modifyvm", "{{.Name}}", "--vram", "128"], ["modifyvm", "{{.Name}}", "--audio", "pulse"]]
  virtualbox_version_file = ".vbox_version"
  vm_name                 = "${var.vm_name}"
}
