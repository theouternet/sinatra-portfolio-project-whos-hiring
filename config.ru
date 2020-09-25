require './config/environment'


use Rack::MethodOverride
use UsersController
use LeadsController
run ApplicationController