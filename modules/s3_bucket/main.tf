# resource "aws_s3_bucket" "sweet-Bucket" {
#   bucket=var.s3-bucket-name
#   force_destroy = true
# }
resource "aws_s3_bucket" "my-static-bucket" {
  bucket= var.bucket_name
  force_destroy = true
}

resource "aws_s3_object" "myapp" {
    # bucket = "my-static-bucket"
    bucket=aws_s3_bucket.my-static-bucket.bucket
   for_each = fileset("modules/s3_bucket/mysite/", "**/*.*") 
   key = each.value
   source = "modules/s3_bucket/mysite/${each.value}"
   content_type = each.value
  # content_type = lookup(var.mime_types, each.value, "binary/octet-stream")

  
}