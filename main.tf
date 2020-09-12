module "autoscaling" {
    source      = ".//autoscaling"
    namespace   = var.namespace
    ssh_keypair = var.ssh_keypair
    
    vpc       = module.networking.vpc
    sg        = module.networking.sg
    db_config = module.database.db_config
}

module "database" {
    source      = ".//database"
    namespace   = var.namespace
    
    vpc = module.networking.vpc
    sg  = module.networking.sg
}

module "networking" {
    source = ".//networking"
    namespace = var.namespace
}
