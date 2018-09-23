### Debugging neo with VS Code

- After installing ruby, make sure you have also installed bundler and rake
    
    `gem install rake`
    
    `gem install bundle`

- Install debase
    
    `gem install debase`

- Install ruby-debug-ide
    
    `gem install ruby-debug-ide`

- Install VS Code Ruby Extension 

- The .vscode folder already contains a launch.js configuration file that can be changed as needed.

- If you are running a tool like aws-vault to keep credentials stored securely, you can run neo as follows:

aws-vault exec mars -- bundle exec ruby ./bin/neo create_pipeline <pipeline-yml-location>