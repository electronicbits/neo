old_verbose = $VERBOSE
$VERBOSE = nil
# OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

require 'rubygems'
require 'commander/import'
require 'version'

program :name 
program :version, Neo::VERSION
program :description, 'builds and deploys apps using AWS code tools'



$VERBOSE = old_verbose

global_option('-c', '--config FILE', 'Load apps.yaml configuration from the specified file')
global_option('-s', '--slice name', 'specify a slice name')
global_option('-e', '--environment name', 'Must be kaos or prod')

command :build do |c|
  c.syntax = 'neo build'
  c.description = 'Runs the build command configured inside the app.yml'
  c.action do |args, options|
    puts 'this is a test'

  end
end
