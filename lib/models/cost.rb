class Cost < Sequel::Model
  plugin :timestamps

  many_to_one :size
  many_to_one :zone
  many_to_one :service
end
