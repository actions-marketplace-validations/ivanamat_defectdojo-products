#!/usr/bin/bash

set -e

JSON="{"

if [[ -z "$INPUT_TOKEN" ]]
then
    echo "ERROR: Yoy must provide a valid token!"
    exit 1
fi

if [[ -z "$INPUT_DEFECTDOJO_URL" ]]
then
    echo "ERROR: You must provide a valid defectdojo url included import-scan endpoint. Example: https://defectdojo.domain.com/api/v2/import-scan/"
    exit 1
fi

if [[ ! -z "$INPUT_TAGS" ]]
then
    JSON+='"tags":['$INPUT_TAGS'],'
fi
  
if [[ ! -z "$INPUT_NAME" ]]
then
    JSON+='"name":"'$INPUT_NAME'",'
fi

if [[ ! -z "$INPUT_DESCRIPTION" ]]
then
    JSON+='"description":"'$INPUT_DESCRIPTION'",'
fi

if [[ ! -z "$INPUT_PROD_NUMERIC_GRADE" ]]
then
    JSON+='"prod_numeric_grade":'$INPUT_PROD_NUMERIC_GRADE','
fi
  
if [[ ! -z "$INPUT_BUSINESS_CRITICALITY" ]]
then
    JSON+='"business_criticality":"'$INPUT_BUSINESS_CRITICALITY'",'
fi

if [[ ! -z "$INPUT_PLATFORM" ]]
then
    JSON+='"platform":"'$INPUT_PLATFORM'",'
fi

if [[ ! -z "$INPUT_LIFECYCLE" ]]
then
    JSON+='"lifecycle":"'$INPUT_LIFECYCLE'",'
fi

if [[ ! -z "$INPUT_ORIGIN" ]]
then
    JSON+='"origin":"'$INPUT_ORIGIN'",'
fi

if [[ ! -z "$INPUT_USER_RECORDS" ]]
then
    JSON+='"user_records":'$INPUT_USER_RECORDS','
fi

if [[ ! -z "$INPUT_REVENUE" ]]
then
    JSON+='"revenue":"'$INPUT_REVENUE'",'
fi  
  
if [[ ! -z "$INPUT_EXTERNAL_AUDIENCE" ]]
then
    JSON+='"external_audience":"'$INPUT_EXTERNAL_AUDIENCE'",'
fi  

if [[ ! -z "$INPUT_INTERNET_ACCESSIBLE" ]]
then
    JSON+='"internet_accessible":"'$INPUT_INTERNET_ACCESSIBLE'",'
fi  

if [[ ! -z "$INPUT_ENABLE_SIMPLE_RISK_ACCEPTANCE" ]]
then
    JSON+='"enable_simple_risk_acceptance":"'$INPUT_ENABLE_SIMPLE_RISK_ACCEPTANCE'",'
fi  
  
if [[ ! -z "$INPUT_ENABLE_FULL_RISK_ACCEPTANCE" ]]
then
    JSON+='"enable_full_risk_acceptance":"'$INPUT_ENABLE_FULL_RISK_ACCEPTANCE'",'
fi  
  
if [[ ! -z "$INPUT_PRODUCT_MANAGER" ]]
then
    JSON+='"product_manager":'$INPUT_PRODUCT_MANAGER','
fi

if [[ ! -z "$INPUT_TECHNICAL_CONTACT" ]]
then
    JSON+='"technical_contact":'$INPUT_TECHNICAL_CONTACT','
fi

if [[ ! -z "$INPUT_TEAM_MANAGER" ]]
then
    JSON+='"team_manager":'$INPUT_TEAM_MANAGER','
fi
  
if [[ ! -z "$INPUT_PROD_TYPE" ]]
then
    JSON+='"prod_type":'$INPUT_PROD_TYPE','
fi
  
if [[ ! -z "$INPUT_REGULATIONS" ]]
then
    JSON+='"regulations":'[$INPUT_REGULATIONS']'
fi

JSON+="}"

JSON=$(echo "$JSON" | sed -e 's/,}/}/g')

response=$(curl "$INPUT_DEFECTDOJO_URL$INPUT_DEFECTDOJO_ENDPOINT" -H "Authorization: Token $INPUT_TOKEN" -H "accept: application/json" -H  "Content-Type: application/json" -d "$JSON")
echo "::set-output name=response::$( echo $response)"
