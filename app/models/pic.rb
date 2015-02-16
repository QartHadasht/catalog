class Pic < ActiveRecord::Base
  has_attached_file :image, :styles => { :thumb => "130x130>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  belongs_to :tovar
end
