resource "aws_s3_bucket" "mongodb_backups" {
  bucket_prefix = "mongodb-backups-"

  tags = {
    Name = "Sauvegarde mongoDB"
  }
}

resource "aws_s3_bucket_versioning" "mongodb_backups_versioning" {
  bucket = aws_s3_bucket.mongodb_backups.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_policy" "mongodb_backups_policy" {
  bucket = aws_s3_bucket.mongodb_backups.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action    = ["s3:GetObject"],
        Effect    = "Allow",
        Principal = "*",
        Resource  = ["${aws_s3_bucket.mongodb_backups.arn}/*"],
      },
    ]
  })
}
