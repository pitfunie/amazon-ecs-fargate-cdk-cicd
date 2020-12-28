# The AWS CDK Toolkit, the CLI command cdk, is the primary tool for interacting with your AWS CDK app. It executes your 
# app, interrogates the application model you defined, and produces and deploys the AWS CloudFormation templates generated 
# by the AWS CDK. It also provides other features useful for creating and working with AWS CDK projects. This topic contains 
# information about common use cases of the CDK Tool


# This project helps you build a complete Amazon ECS cluster and CI/CD pipeline with CodeBuild in AWS CDK.

# Step1. Cloud9 and commands to run: Procedures 

https://github.com/aws-samples/amazon-ecs-fargate-cdk-cicd

# However using MacOS Catalina

# Configure the Repository by forking the repository to into my account pitfunie@gmail.com

https://github.com/aws-samples/amazon-ecs-fargate-cdk-cicd


# Modify the ecs_cdk-stack.ts file .ts extensions are MPEG vidoe store files
/cdk/lib/ecs_cdk-stack.ts 
# Add the name of our Github username
# Example
const sourceAction = new codepipeline_actions.GitHubSourceAction({
      actionName: 'GitHub_Source',
      owner: 'pitfunie',
      repo: 'amazon-ecs-fargate-cdk-cicd',
      branch: 'master',
      oauthToken: cdk.SecretValue.secretsManager("/my/github/token"),
      //oauthToken: cdk.SecretValue.plainText('<plain-text>'),
      output: sourceOutput
    });

#Configure the Secret for your GitHub Token

aws configure set region $AWS_REGION
aws secretsmanager create-secret --name /my/github/token --secret-string vscode://vscode.github-authentication/did-authenticate?windowid=1&code=38439c35fb700d16d4b0&state=2976eb5b-f291-422b-8582-fcde1929a0a0 

{
    "ARN": "arn:aws:secretsmanager:us-east-1:274948764147:secret:/my/github/token-04QrYd",
    "Name": "/my/github/token",
    "VersionId": "f70038a5-1f94-473b-a53a-17494c5c3973"
}

# Get the secret password
aws secretsmanager get-secret-value --secret-id /my/github/token --version-stage AWSCURRENT

# Now, run the below command to authorize CodeBuild to access your GitHub account and replace the with your GitHub Token ID

# Replace the <GITHUB-TOKEN> with your GitHub Token ID:

aws codebuild import-source-credentials --server-type GITHUB --auth-type PERSONAL_ACCESS_TOKEN --token token-04QrYd

# Verify Access to my GitHub
aws codebuild list-source-credentials 
{
    "sourceCredentialsInfos": [
        {
            "arn": "arn:aws:codebuild:us-east-1:274948764147:token/github",
            "serverType": "GITHUB",
            "authType": "PERSONAL_ACCESS_TOKEN"
        }
    ]
}

Now access the cloned directory:

cd amazon-ecs-cdk-cicd/cdk

Prepare CDK prerequisite:

sudo yum install -y npm
npm install -g aws-cdk
npm install -g typescript@latest

Steps. CDK Commands to launch the infrastructure:

cd cdk
cdk init
npm install
npm run build
cdk ls

Ensure that the CDK stack name is: EcsCdkStack

cdk synth
#cdk bootstrap aws://$ACCOUNT_ID/$AWS_REGION
cdk bootstrap aws://274948764147/us-east-1
cdk deploy

# CDKToolkit

