# frozen_string_literal: true

require "bundler/gem_tasks"

Bundler.require :default, :development
Combustion.path = "test/internal"
Combustion.initialize!(:all)

APP_RAKEFILE = File.expand_path("../test/internal/Rakefile", __FILE__)
load "rails/tasks/engine.rake"

# APP_RAKEFILE = File.expand_path("../test/dummy/Rakefile", __FILE__)
# load "rails/tasks/engine.rake"
# require "masq2"

# Setup Reek
begin
  require "reek/rake/task"

  Reek::Rake::Task.new do |t|
    t.fail_on_error = true
    t.verbose = false
    t.source_files = "{app,config,db,lib,test}/**/*.rb"
  end
rescue LoadError
  task(:reek) do
    warn("reek is disabled")
  end
end

# Setup Yard
begin
  require "yard"

  YARD::Rake::YardocTask.new(:yard)
rescue LoadError
  task(:yard) do
    warn("yard is disabled")
  end
end

# Setup RuboCop-LTS
begin
  require "rubocop/lts"
  Rubocop::Lts.install_tasks
rescue LoadError
  task(:rubocop_gradual) do
    warn("RuboCop (Gradual) is disabled")
  end
end

# Setup Kettle Soup Cover
begin
  require "kettle-soup-cover"
  Kettle::Soup::Cover.install_tasks
rescue LoadError
  desc("alias coverage task to test (coverage unavailable)")
  task(coverage: :test)
end

# Setup stone_checksums
begin
  require "stone_checksums"
  GemChecksums.install_tasks
rescue LoadError
  task("build:generate_checksums") do
    warn("gem_checksums is not available")
  end
end

require "rake/testtask"

namespace :test do |ns|
  desc "Prepare tests"
  task :prepare do
    # Rails.env = "test"
    Rake::Task["db:reset"].invoke
  end

  tests = %w(unit functional integration)

  tests.each do |type|
    desc "Run #{type} tests"
    Rake::TestTask.new(type) do |t|
      t.libs << "lib"
      t.libs << "test"
      t.test_files = FileList["test/#{type}/**/*_test.rb"]
      t.verbose = false
    end
  end

  desc "Run all tests"
  Rake::TestTask.new("all") do |t|
    files = []
    tests.each { |type| files += FileList["test/#{type}/**/*_test.rb"] }

    t.libs << "lib"
    t.libs << "test"
    t.test_files = files
    t.verbose = false
  end
end

test_tasks = %w[test:prepare test:all]
test_tasks.push("coverage") unless ENV.fetch("CI", "").casecmp?("true")

Rake::Task["test"].clear
desc "Run tests"
task test: test_tasks

# coverage task will open coverage in browser locally
task default: %i[coverage rubocop_gradual:autocorrect yard reek]
