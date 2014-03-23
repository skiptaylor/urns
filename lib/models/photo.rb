class Photo < Sequel::Model
  plugin :timestamps

  many_to_one :product
  many_to_one :fader
  many_to_one :logo

  mount_uploader :source, Uploader
end
