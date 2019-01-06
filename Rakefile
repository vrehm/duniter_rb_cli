require "bundler/gem_tasks"
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new(:spec)

require "rake/extensiontask"

task :build => :compile

Rake::ExtensionTask.new("duniter_rb_cli") do |ext|
  ext.lib_dir = "lib/duniter_rb_cli"
end

task :default => [:clobber, :compile, :spec]
