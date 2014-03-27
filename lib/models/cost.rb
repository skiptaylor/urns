class Cost < Sequel::Model
  plugin :timestamps

  one_to_many :sizes
end
