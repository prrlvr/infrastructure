variable "proxmox_api_token_secret"  {
    description = "token for proxox api"
    type = string
    sensitive = true
}

variable "proxmox_api_token_id"  {
    description = "token id for proxox api"
    type = string
    sensitive = true
}
