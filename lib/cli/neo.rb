old_verbose = $VERBOSE
$VERBOSE = nil
# OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

require 'rubygems'
require 'commander/import'
require 'version'
require 'Startup'

program :name 
program :version, Neo::VERSION
program :description, 'builds and deploys apps using AWS code tools'

$VERBOSE = old_verbose

# global_option('-c', '--config FILE', 'Load apps.yaml configuration from the specified file')
# global_option('-s', '--slice name', 'specify a slice name')
# global_option('-e', '--environment name', 'Must be kaos or prod')

#in windows, run with 
#bundle exec ruby .\bin\neo create_pipeline 
#or ruby -Ilib .\bin\neo build
#in linux, run with
#bundle exec neo build

# command :build do |c|
#   c.syntax = 'neo build'
#   c.description = 'Runs the build command configured inside the app.yml'
#   c.action do |args, options|
#     puts 'this is a test'
    
#   end
# end

# run with
# bundle exec ruby .\bin\neo create_pipeline \cli\pipeline.yml d:/DEV/aws-tools/neo/pipeline.yml --trace

command :create_pipeline do |c|
  c.syntax = 'neo create_pipeline <configfile>'
  c.description = 'Creates a codepipeline in AWS'
  c.action do |args, options|
    
    puts 'Creating codepipeline ...'

    
    config_file = args[0]
    puts args[0]
    result_file_location = args[1]
    
    startup = Neo::Startup.new 

    # startup.parse(config_file, result_file_location)

    

  end
end