class Page < ActiveRecord::Base

  def to_param
    location
  end
end
