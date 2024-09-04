#region GENERAL
variable "hcloud_token" {
    type = string
    sensitive = true
    description = "The hetzner cloud access token"
}
#endregion

#region SSH KEYS
variable "public_key_path" {
    type = string
    description = "The path to the public key file to use for server access"

    validation {
        condition = fileexists(var.public_key_path)
        error_message = "The given path is not valid"
    }
}

variable "private_key_path" {
    type = string
    description = "The path to the private key file to use for server access"

    validation {
        condition = fileexists(var.public_key_path)
        error_message = "The given path is not valid"
    }
}
#endregion

#region SERVER
variable "server_image" {
    type = string
    description = "The image to use for the server deployment"
}

variable "server_type" {
    type = string
    description = "The server type to use"
}

variable "location" {
    type = string
    description = "The location to the deploy the server in"
}
#endregion