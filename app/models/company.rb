class Company < ActiveRecord::Base
  geocoded_by :address, 
  :latitude => :lat, :longitude => :lng
  after_validation :geocode

  has_attached_file :image,
    styles: {
      large:"600x600>",
      thumb: "100x100>" 
    },
    :default_url => "/images/:style/missing.png"

  validates_attachment_content_type :image, 
     :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

end





