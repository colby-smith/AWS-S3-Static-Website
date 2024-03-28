### Creating an S3 bucket. ###
resource "aws_s3_bucket" "static_web_bucket" {
    bucket        = "colby-smith-static-web-bucket"
    force_destroy = true
}

### Create the website configuration. ###
resource "aws_s3_bucket_website_configuration" "static_web_bucket_config" {
    bucket = aws_s3_bucket.static_web_bucket.id
    index_document {
      suffix = "index.html"
    }
    error_document {
      key = "error.html"
    }
}

### Turning off S3 bucket public access block. ###
resource "aws_s3_bucket_public_access_block" "static_web_bucket_public_access" {
    bucket                  = aws_s3_bucket.static_web_bucket.id
    block_public_acls       = false
    block_public_policy     = false
    ignore_public_acls      = false
    restrict_public_buckets = false 
}

### Upload index.html document as S3 object. ###
resource "aws_s3_object" "upload_index_html_object" {
  bucket = aws_s3_bucket.static_web_bucket.id
  key    = "index.html"
  source = "C:/Users/colby.smith/Documents/GitHub/AWS-S3-Static-Website/html/index.html"
}

### Upload error.html document as S3 object. ###
resource "aws_s3_object" "upload_error_html_object" {
  bucket = aws_s3_bucket.static_web_bucket.id
  key    = "error.html"
  source = "C:/Users/colby.smith/Documents/GitHub/AWS-S3-Static-Website/html/error.html"
}