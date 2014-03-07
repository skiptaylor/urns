```ruby
require 'sinatra/base'
require 'urns'
require 'urns/helpers'
require 'urns/models'

class App < Sinatra::Application

  helpers Urns::Helpers

  use Urns::Routes

  get '/?' do
    sample_helper()
    ModelTwo.display_name
    erb :hello
  end

end

App.run!
```
