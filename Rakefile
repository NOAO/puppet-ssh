require 'puppetlabs_spec_helper/rake_tasks'
require 'puppet-lint/tasks/puppet-lint'

PuppetLint.configuration.send("disable_documentation")
PuppetLint.configuration.ignore_paths = ["spec/**/*.pp", 'tests/**/*.pp']

task :default => [:spec, :lint]
