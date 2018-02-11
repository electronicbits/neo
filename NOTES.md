user will:

- add apps.yml file to project in repository
- run neo to create the pipeline for the project with an auto-updatable pipeline
the auto-updatable pipeline will read the app.yml and will reconfigure the pipeline based on those settings
the first step of that pipeline will be a ruby command that will execute neo to create the pipeline based on app.yml

github code :
6ed8f72149f20e3eb9c439b43b6a7a65d5c81a4f


Current project structure

-src
    -
-deploy
    -
-build

