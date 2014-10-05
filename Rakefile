require 'bundler/gem_tasks'

namespace :update do
  
  desc 'Update git'
  task :git, [:message] do |t, args|
    system 'git add .'
    system "git commit -m '#{args[:message]}'"
    system 'git push'
  end
  
  desc "update heroku app"
  task :heroku, [:app] do |t, args|
    system "heroku run bundle -a #{args[:app]}"
  end
  
  desc "update github then heroku app"
  task :both, [:message, :app] do |t, args|
    Rake::Task["update:git"].invoke(args[:message])
    Rake::Task["update:heroku"].invoke(args[:app])
  end
  
  
end
