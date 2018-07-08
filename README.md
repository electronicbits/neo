# Neo

Manage your CI/CD pipelines without build or deployment agents using AWS code tools.

![neo vs agent](https://github.com/electronicbits/neo/blob/master/neo.gif "neo vs agent")

Assume less responsibilities, while at the same time achieving the same goal.

## Advantages:

- Managed services
- Cheap, very cheap.
- No need to maintain agents or pay the costs associated.
- Pay only for the used services
- Each codepipeline is free for the first 30 days (AWS lets you experiment with it)
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

### Can we update the (code)pipeline on the fly ?

Yes. We need to set the RestartExecutionOnUpdate: true on the pipeline settings inside the cloudformation.
Secondly, the second stage of the pipeline would be required to make a call to update the stack.

### Do we need to use CodeDeploy to deploy applications?

Not always. 

In many cases, CodeBuild project will suffice, as it will be a matter of simply executing a postbuild command that could:

- copy resources to a S3 bucket
- build and upload docker images (the build will not just create the image, but also execute any build process)


### Running Neo

You have two options:

1- Install the gem locally:

After cloning this repository, build the gem file:

`gem build neo.gemspec`

Once the gem file is generated, proceed to install it locally

`gem install --local neo-0.1.0.gem`

You can now run neo as a CLI:

`bundle exec neo build`

2- Run the bin file directly after cloning the repo:

`bundle exec ruby .\bin\neo build`

