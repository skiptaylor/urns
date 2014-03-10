namespace :db do
  desc 'Run migrations'
  task :migrate, [:version] do |t, args|
    Sequel.extension :migration
    db = Sequel.connect(ENV.fetch("DATABASE_URL"))
    if args[:version]
      Sequel::Migrator.run db,
                           "#{File.dirname(__FILE__)}/../migrations",
                           target: args[:version].to_i
    else
      Sequel::Migrator.run db, "#{File.dirname(__FILE__)}/../migrations"
    end
  end
end
