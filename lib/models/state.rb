class State < Sequel::Model
  plugin :timestamps

  many_to_one :region
end
