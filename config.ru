$:.unshift "./app"


require 'models'
require 'api'

use Rack::Cors do
    allow do
      origins '*'
      resource '*', :headers => :any, :methods => [:get, :put, :create, :delete, :post]
    end
end

run API