module "eks-jx" {
  source          = "jenkins-x/eks-jx/aws"
  cluster_name    = var.cluster_name
  cluster_version = var.cluster_version
  region          = var.region 
  vault_user      = var.vault_user
  is_jx2          = false
  jx_git_url      = var.jx_git_url
  jx_bot_username = var.jx_bot_username
  jx_bot_token    = var.jx_bot_token
  force_destroy   = var.force_destroy
  # map_users = [
  # {
  #   userarn  = "arn:aws:iam::889605739882:user/solomon.asamoah"
  #   username = "solomon.asamoah"
  #   groups   = ["system:masters"]
  # },
  #   {
  #   userarn  = "arn:aws:iam::889605739882:user/ram.tandukar"
  #   username = "ram.tandukar"
  #   groups   = ["system:masters"]
  # }
  # ]
  enable_external_dns = true
  apex_domain = "jx3.cloudnative.nttdatauk.cloud"
}
terraform {
  backend "s3" {
    bucket = "tf-state-jx3"
    key    = "tf.tfstate"
    region = "eu-west-2"
    dynamodb_table = "tf-jx3-lock"
  }
}
