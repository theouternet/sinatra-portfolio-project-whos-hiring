require './config/environment'

if ActiveRecord::Base.connection.migration_context.needs_migration?
  raise 'Migrations pending. Run `rake db:migrate`'
end

use Rack::MethodOverride
use UsersController
use LeadsController
run ApplicationController