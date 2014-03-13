class Woodtype < Sequel::Model
  plugin :timestamps

  one_to_many :materials
end
