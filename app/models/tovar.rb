class Tovar < ActiveRecord::Base
  belongs_to :cat
  has_many :pics, :dependent => :destroy
  accepts_nested_attributes_for :pics, allow_destroy: true
  def price2
    @dollar = (Setting.where(:alias => 'dollar').first.try(:value) || 1).to_i
    return (price*@dollar).to_i
  end  
end
