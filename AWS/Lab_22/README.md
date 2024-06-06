# AWS S3 Bucket Management with AWS CLI

## Prerequisites

- An AWS account with appropriate permissions to create and manage S3 buckets.
- AWS CLI installed and configured with appropriate access keys and permissions.
## Steps

### 1. Create an S3 Bucket

```bash
aws s3api create-bucket --bucket ivolve-1
```
![Screenshot from 2024-05-29 02-59-09](https://github.com/marwantarek11/IVOLVE_Training/assets/167176241/cd54a448-24c5-4574-86c9-9dddd521aa94)



### 2. Configure Bucket Permissions

```bash
aws s3api put-bucket-policy --bucket ivolve-1 --policy file:/policy.json
```

```json
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": "*",
            "Action": [
                "s3:PutObject",
                "s3:GetObject",
                "s3:ListBucket"
            ],
            "Resource": [
                "arn:aws:s3:::ivolve-1",
                "arn:aws:s3:::ivolve-1/*"
            ]
        }
    ]
}

```
![Screenshot from 2024-05-29 03-01-50](https://github.com/marwantarek11/IVOLVE_Training/assets/167176241/9b4f06b0-30ec-48bf-9634-d1326ac97d18)

### 3. Upload/Download Files

To upload a file to your S3 bucket:

```bash
aws s3 cp ~/marwan.txt s3://ivolve-1/
```
![Screenshot from 2024-05-29 03-03-38](https://github.com/marwantarek11/IVOLVE_Training/assets/167176241/83338808-f03b-495d-9f71-787d4ef8298d)



To download a file from your S3 bucket:

```bash
aws s3 cp s3://ivolve-1/marwan.txt ~/Documents
```
![Screenshot from 2024-05-29 03-07-09](https://github.com/marwantarek11/IVOLVE_Training/assets/167176241/634cafe1-5315-49f4-a31c-4babbb48e0cb)


### 4. Enable Versioning

```bash
aws s3api put-bucket-versioning --bucket ivolve-1  --versioning-configuration Status=Enabled
```

### 5. Enable Logging

First, create a bucket to store logs:

```bash
aws s3api create-bucket --bucket ivolve-1-logging
```

In the `logging.json` file, specify the target bucket and the log file prefix.
Then, enable logging for your main bucket:
```json
{
    "LoggingEnabled": {
        "TargetBucket": "ivolve-1-logging",
        "TargetPrefix": "logs/"
    }
}
```

```bash
aws s3api put-bucket-logging --bucket ivolve-1  --bucket-logging-status file://Logging.json
```


