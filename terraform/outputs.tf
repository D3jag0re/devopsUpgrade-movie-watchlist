output "vm_A_id" {
  value = module.virtual_machine_A.vm_id
}

#Not best practice, I know.
output "gimmie_key" {
  value       = module.virtual_machine_A.tls_private_key
  description = "Private Key in PEM format"
  sensitive   = true
}
# To get the corresponding private key, run terraform output gimmie_key