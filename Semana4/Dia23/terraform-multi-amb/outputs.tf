output "bucket_names" {
  value = {
    for env, bucket in aws_s3_bucket.per_env :
    env => bucket.id
  }
}