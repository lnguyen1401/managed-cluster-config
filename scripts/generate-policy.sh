#!/bin/bash
DIRECTORY="./tmp/policy-generator-templates/*/*"
FILENAME="policy-generator-config.yaml"
find $DIRECTORY -name $FILENAME -exec sh -c '
for file; do
    GENERATED_POLICIES="./deploy/acm-policies"
    name=$(grep -m 1 "name:" $file | cut -d: -f2- | xargs)
    $PolicyGenerator $file > ./deploy/acm-policies/50-GENERATED-$name.Policy.yaml
done' sh {} +
