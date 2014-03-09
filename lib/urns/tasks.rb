require './app'

class Sinatra::Application
  extend Rake::DSL if defined? Rake::DSL
end

Dir[File.join(File.dirname(__FILE__) + "/../tasks/**/*.rake")].each do |file|
  import file
end

Dir["./tasks/**/*.rake"].each do |file|
  import file
end
