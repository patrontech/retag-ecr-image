# retag-ecr-image
Retag an existing ECR image

Use this in conjunction with `aws-actions/configure-aws-credentials` and `aws-actions/amazon-ecr-login`. 

## Inputs

### `existing-tag`
**Required** The name of the existing docker image tag that you want to re-tag.

### `new-tag`
**Required** The the new tag name to give the image in ECR.

### `repository-name`
**Required** The name of the repository where the existing image can be found.

## Outputs
None

## Example usage
```
jobs:
  update-docker-image:
    steps:
      - name: Set AWS credentials
        uses: aws-actions/configure-aws-credentials@v1
        with:
          aws-access-key-id: ${{ secrets.YOUR_AWS_ACCESS_KEY_ID }}
          aws-secret-access-key: ${{ secrets.YOUR_AWS_SECRET_ACCESS_KEY }}
          aws-region: us-east-1

      - name: Login to ECR
        id: login-ecr
        uses: aws-actions/amazon-ecr-login@v1

      - name: Retag Existing Image
        id: docker_image_build_retag
        uses: patrontech/retag-ecr-image@v1
        with:
          existing-tag: "1.0.0"
          new-tag: "TESTING-1.0.0"
          repository-name: your-ecr-repo-name
```