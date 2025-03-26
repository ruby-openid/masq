# frozen_string_literal: true

# Compat: Ruby >= 2.2.2
# Test Matrix:
#   - Ruby 2.7
appraise "rails-5-2" do
  # Load order is very important with combustion!
  gem "combustion", "~> 1.5"
  gem "sqlite3", "~> 1.4"

  gem "rails", "~> 5.2.8.1"
  gem "nokogiri"
  eval_gemfile "modular/mini_testing.gemfile"
  remove_gem "appraisal" # only present because it must be in the gemfile because we target a git branch
end

# Compat: Ruby >= 2.5
# Test Matrix:
#   - Ruby 2.7
appraise "rails-6-0" do
  # Load order is very important with combustion!
  gem "combustion", "~> 1.5"
  gem "sqlite3", "~> 1.4"

  gem "rails", "~> 6.0.6.1"
  eval_gemfile "modular/mini_testing.gemfile"
  remove_gem "appraisal" # only present because it must be in the gemfile because we target a git branch
end

# Compat: Ruby >= 2.5
# Test Matrix:
#   - Ruby 2.7
#   - Ruby 3.0
appraise "rails-6-1" do
  # Load order is very important with combustion!
  gem "combustion", "~> 1.5"
  gem "sqlite3", "~> 1.4"

  gem "rails", "~> 6.1.7.10"
  eval_gemfile "modular/mini_testing.gemfile"
  remove_gem "appraisal" # only present because it must be in the gemfile because we target a git branch
end

# Compat: Ruby >= 2.7
# Test Matrix:
#   - Ruby 3.0
#   - Ruby 3.1
appraise "rails-7-0" do
  # Load order is very important with combustion!
  gem "combustion", "~> 1.5"
  gem "sqlite3", "~> 1.4"

  gem "rails", "~> 7.0.8.7"
  eval_gemfile "modular/mini_testing.gemfile"
  remove_gem "appraisal" # only present because it must be in the gemfile because we target a git branch
end

# Compat: Ruby >= 2.7
# Test Matrix:
#   - jruby-9.4 (targets Ruby 3.1 compatibility)
#   - truffleruby-22.3 (targets Ruby 3.0 compatibility)
#   - Ruby 3.1
#   - Ruby 3.2
appraise "rails-7-1" do
  # Load order is very important with combustion!
  gem "combustion", "~> 1.5"
  gem "sqlite3", "~> 2.0"

  gem "rails", "~> 7.1.5.1"
  eval_gemfile "modular/mini_testing.gemfile"
  remove_gem "appraisal" # only present because it must be in the gemfile because we target a git branch
end

# Compat: Ruby >= 3.1
# Test Matrix:
#   - jruby-9.4 (targets Ruby 3.1 compatibility)
#   - truffleruby-23.0 (targets Ruby 3.1 compatibility)
#   - Ruby 3.2
#   - Ruby 3.3
#   - Ruby 3.4
appraise "rails-7-2" do
  # Load order is very important with combustion!
  gem "combustion", "~> 1.5"
  gem "sqlite3", "~> 2.0"

  gem "rails", "~> 7.2.2.1"
  eval_gemfile "modular/mini_testing.gemfile"
  remove_gem "appraisal" # only present because it must be in the gemfile because we target a git branch
end

# Compat: Ruby >= 3.2
# Test Matrix:
#   - truffleruby-23.1 (targets Ruby 3.2 compatibility)
#   - truffleruby-24.1 (targets Ruby 3.3 compatibility)
#   - Ruby 3.2
#   - Ruby 3.3
#   - Ruby 3.4
appraise "rails-8-0" do
  # Load order is very important with combustion!
  gem "combustion", "~> 1.5"
  gem "sqlite3", "~> 2.0"

  gem "rails", "~> 8.0.2"
  eval_gemfile "modular/mini_testing.gemfile"
  remove_gem "appraisal" # only present because it must be in the gemfile because we target a git branch
end

# Only run security audit on latest Ruby version
appraise "audit" do
  # Load order is very important with combustion!
  gem "combustion", "~> 1.5"
  gem "sqlite3", "~> 2.0"

  gem "rails", "~> 8.0.2"
  eval_gemfile "modular/audit.gemfile"
  remove_gem "appraisal" # only present because it must be in the gemfile because we target a git branch
end

# Only run coverage on latest Ruby version
appraise "coverage" do
  # Load order is very important with combustion!
  gem "combustion", "~> 1.5"
  gem "sqlite3", "~> 2.0"

  gem "rails", "~> 8.0.2"
  eval_gemfile "modular/coverage.gemfile"
  eval_gemfile "modular/mini_testing.gemfile"
  remove_gem "appraisal" # only present because it must be in the gemfile because we target a git branch
end

# Only run linter on latest Ruby version (but, in support of oldest supported Ruby version)
appraise "style" do
  # Load order is very important with combustion!
  gem "combustion", "~> 1.5"
  gem "sqlite3", "~> 2.0"

  gem "rails", "~> 8.0.2"
  eval_gemfile "modular/style.gemfile"
  remove_gem "appraisal" # only present because it must be in the gemfile because we target a git branch
end
