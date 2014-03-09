require 'sinatra/base'

module Urns
  module Helpers

    def find_template(views, name, engine, &block)
      views.each { |v| super(v, name, engine, &block) }
    end

  end
end
