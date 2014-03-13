class Fader < Sequel::Model
  plugin :timestamps

  one_to_one :photo
end
