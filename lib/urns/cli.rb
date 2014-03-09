require 'urns'
require 'thor'

module Urns
  class CLI < Thor
    include Thor::Actions

    def self.source_root
      "#{File.dirname(__FILE__)}/../.."
    end

    desc 'create [APP]', 'Creates a new app'
    def create(app)
      directory 'template', app
      system "cd #{app} && bundle"
    end
  end
end
