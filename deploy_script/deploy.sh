cloudfront_distribution_id=$(aws ssm get-parameter \
   --name "/kicl/$REGION_NAME/usermgmtui/$CI_ENVIRONMENT_NAME/CdnDistributionId" \
   --query "parameter.value" \
   --output text)
   
echo "Cloudfront distribution ID : "$cloudfront_distribution_id

#invalidate cloudfront cache
aws cloudfront create-invalidation --distribution-id ${cloudfront_distribution_id} --path "/*"
