resource "aws_s3_bucket" "this" {
  bucket_prefix = "${var.name}-"
  tags          = var.tags

  versioning {
    enabled = true
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  lifecycle {
    # facilitates idempotent stateless execution
    ignore_changes = [acl, bucket_prefix, force_destroy]
  }
}

resource "aws_s3_bucket_public_access_block" "this" {
  bucket              = aws_s3_bucket.this.id
  block_public_acls   = true
  block_public_policy = true
}
