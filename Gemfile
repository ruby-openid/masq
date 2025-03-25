source "https://rubygems.org"

git_source(:github) { |repo_name| "https://github.com/#{repo_name}" }
git_source(:gitlab) { |repo_name| "https://gitlab.com/#{repo_name}" }

#### IMPORTANT #######################################################
# Gemfile is for local development ONLY; Gemfile is NOT loaded in CI #
####################################################### IMPORTANT ####

# Load order it important for combustion, so make sure it loads first!
gem "combustion", "~> 1.5"

# Common Deps
eval_gemfile "gemfiles/modular/common.gemfile"

# Include dependencies from <gem name>.gemspec
gemspec

# Security Audit
eval_gemfile "gemfiles/modular/audit.gemfile"

# Debugging
eval_gemfile "gemfiles/modular/debug.gemfile"

# Code Coverage
eval_gemfile "gemfiles/modular/coverage.gemfile"

# Linting
eval_gemfile "gemfiles/modular/style.gemfile"

# Documentation
eval_gemfile "gemfiles/modular/documentation.gemfile"

# DB Adapters
eval_gemfile "gemfiles/modular/db_adapters.gemfile"

# Testing
eval_gemfile "gemfiles/modular/mini_testing.gemfile"

# Local Testing (not applicable to CI)
# gem "guard-minitest"

gem "appraisal", github: "pboling/appraisal", branch: "galtzo"

# For local testing we'll use Rails v8.0
# In CI we'll use `combustion` and `appraisal` to test other versions
gem "rails", "~> 8.0", ">= 8.0.2"
