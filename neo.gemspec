# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "version"

Gem::Specification.new do |spec|
  spec.name          = "neo"
  spec.version       = Neo::VERSION
  spec.authors       = ["Dario Alvarez"]
  spec.email         = ["dario@electronic-bits.com"]

  spec.summary       = "deploy and build your applications using AWS code tools"
  spec.description   = "deploy and build your applications using AWS code tools"
  spec.homepage      = "https://www.electronic-bits.com"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files = Dir["{bin,lib,spec}/**/*", "LICENSE", "README.md"]
  spec.bindir        = "bin"
  spec.executables   =  ["neo"] #spec.files.grep(%r{^exe/}) { |f| File.basename(f) }  
  spec.require_paths = ["lib"]

  spec.add_dependency 'commander', '>= 4.4'
  spec.add_dependency 'aws-sdk','~> 2'
  # spec.add_dependency 'autostacker24'
  # spec.add_dependency 'lono'

end
