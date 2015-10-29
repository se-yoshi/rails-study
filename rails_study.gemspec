$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "rails_study/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "rails_study"
  s.version     = RailsStudy::VERSION
  s.authors     = ["se-yoshi"]
  s.email       = ["se.yoshi@gmail.com"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of RailsStudy."
  s.description = "TODO: Description of RailsStudy."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["spec/**/*"]

  s.add_dependency "rails", "~> 4.2.1"
  s.add_dependency "sass-rails", "~> 5.0"
  s.add_dependency "uglifier", ">= 1.3.0"
  s.add_dependency "coffee-rails", "~> 4.1.0"
  s.add_dependency "jquery-rails"
  s.add_dependency "turbolinks"
  s.add_dependency "jbuilder", "~> 2.0"
  s.add_dependency "devise"
  s.add_dependency "devise-i18n"
  s.add_dependency "kaminari"
  s.add_dependency "log4r"
  s.add_dependency "rails-i18n"
  s.add_dependency "config"
  s.add_dependency "bootstrap-sass"
  s.add_dependency "bootstrap3-datetimepicker-rails"
  s.add_dependency "bootswatch-rails"
  s.add_dependency "momentjs-rails"

  s.add_development_dependency "pg"
  s.add_development_dependency "sdoc"
  s.add_development_dependency "activerecord-session_store"
  s.add_development_dependency "delayed_job"
  s.add_development_dependency "delayed_job_active_record"
  s.add_development_dependency "rspec"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "factory_girl_rails"
  s.add_development_dependency "database_cleaner"
  s.add_development_dependency "simplecov"
  s.add_development_dependency "bullet"
  s.add_development_dependency "rubocop"
end
