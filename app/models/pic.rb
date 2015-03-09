class Pic < ActiveRecord::Base
  has_attached_file :image, :styles => { :thumb => "252x252>", :big => "1200x800>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  belongs_to :tovar
end
