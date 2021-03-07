# "timestamp" template function replacement
locals { timestamp = regex_replace(timestamp(), "[- TZ:]", "") }

#could not parse template for following block: "template: generated:3:307: executing \"generated\" at <.Name>: can't evaluate field Name in type struct { HTTPIP string; HTTPPort string }"

build {
  sources = ["source.virtualbox-iso.debian"]


  #could not parse template for following block: "template: generated:2:52: executing \"generated\" at <.Vars>: can't evaluate field Vars in type struct { HTTPIP string; HTTPPort string }"
  provisioner "shell" {
    execute_command = "echo '${var.password}' | {{.Vars}} sudo -E -S bash '{{.Path}}'"
    scripts         = ["install.sh"]
  }
  post-processor "shell-local" {
    inline = ["VBoxManage modifyvm ${var.vm_name} --nic1 bridged --nictype1 82545EM --bridgeadapter1 ${var.nic}"]
  }
}
