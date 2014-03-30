class Cost < Sequel::Model
  plugin :timestamps

  many_to_one :size
end
