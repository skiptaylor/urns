namespace :db do
  desc 'Run migrations'
  task :migrate, [:version] do |t, args|
    Dotenv.load File.expand_path("../.env.#{ENV['RACK_ENV']}", __FILE__),
                File.expand_path("../.env",  __FILE__)
    Sequel.extension :migration
    db = Sequel.connect(ENV.fetch("DATABASE_URL"))
    if args[:version]
      Sequel::Migrator.run db, 'migrations', target: args[:version].to_i
    else
      Sequel::Migrator.run db, 'migrations'
    end
  end
end
