# Load DSL and set up stages
require "capistrano/setup"

# Include default deployment tasks
require "capistrano/deploy"

require 'capistrano/rails'
require 'capistrano/rbenv'

require "capistrano/scm/git"
install_plugin Capistrano::SCM::Git

require 'capistrano/puma'
install_plugin Capistrano::Puma
install_plugin Capistrano::Puma::Nginx
install_plugin Capistrano::Puma::Workers

# Load custom tasks from `lib/capistrano/tasks` if you have any defined
Dir.glob("lib/capistrano/tasks/*.rake").each { |r| import r }