class Tovar < ActiveRecord::Base
  belongs_to :cat
  has_many :pics, :dependent => :destroy
  accepts_nested_attributes_for :pics, allow_destroy: true
end
