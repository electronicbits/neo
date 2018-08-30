# Neo

Manage your CI/CD pipelines without build or deployment **agents** using AWS code tools.

![neo vs agent](https://github.com/electronicbits/neo/blob/master/neo.gif "neo vs agent")

Neo helps you stay away from those nasty agents (get it?)

AWS CodeBuild and CodeDeploy are designed to remove concerns about provisioning, managing and scaling build and deployment **agents** by providing ready-to-deploy software packages for building, testing and deploying code on popular platforms (including Windows Server)

Neo aims to take advantage of those services by providing an easy to use yml to cloudformation pipeline generator.

## Advantages:

- Managed services
- Very cheap
- No need to maintain agents or pay the costs associated.
- Pay only for the used services
- Each codepipeline is free for the first 30 days (AWS lets you experiment with it first)
- Builds happen inside docker containers
- Build docker images can be specified
- Already existing list of AWS curated docker containers for building projects

## Disadvantages

- Docker restrictions for complex builds
- Custom mechanisms to have a pipeline per branch.
However, there are already approaches for solving this.
ie. https://github.com/nicolai86/awesome-codepipeline-ci
- Custom mechanisms to trigger a pipeline when a github change occurs
https://aws.amazon.com/blogs/devops/integrating-git-with-aws-codepipeline/

## Current state

This repo presents a proof of concept for codepipeline and codebuild usage to create pipelines.
Two templates are included that allow to: 
- deploy static resources to a public S3 bucket
- deploy node api application to docker

### Can the (code)pipeline be updated on the fly ?

Yes. We need to set the RestartExecutionOnUpdate: true on the pipeline settings inside the cloudformation.
Secondly, the second stage of the pipeline would be required to make a call to update the stack.

### Is CodeDeploy needed to deploy applications?

Not always.

In many cases, CodeBuild project will suffice, as it will be a matter of simply executing a postbuild command that could:

- copy resources to a S3 bucket
- build and upload docker images (the build will not just create the image, but also execute any build process)

## Useful links:

### [Installing neo](docs/installing.md)

### [Debugging neo](docs/debugging.md)

