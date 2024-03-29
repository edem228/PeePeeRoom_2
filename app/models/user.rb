class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
     
         :recoverable, :rememberable, :trackable, :validatable

 geocoded_by :current_sign_in_ip,
 :latitude => :lat , :longitude => :lng
 after_validation :geocode, if: :current_sign_in_ip_changed?
 
end


