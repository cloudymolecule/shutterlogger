require './config/environment'

run ApplicationController
use RollsController
use PhotosController
use CamerasController
use LensController
use UsersController
use Rack::MethodOverride
