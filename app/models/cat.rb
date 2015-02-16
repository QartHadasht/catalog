class Cat < ActiveRecord::Base
  before_save :count_fold
  scope :root, -> {where(:cat_id => 0)}
  has_many :cats
  belongs_to :cat
  has_many :tovars

  def children
    return getchildids([], self.id)
  end

  def parents
    getparents(self)
  end

  private
  
  def count_fold
    fold = 0
    cur = Cat.find(self.id)
    while cur.cat.present?
      fold += 1
      cur = cur.cat
    end
    self.fold = fold
  end

  def getchildids(ids, id)
    cur = Cat.find(id)
    cur.cats.each do |one|
      ids = getchildids(ids, one.id)
    end
    return ids + [id]
  end

  def getparents(cur, arr = [])
    parent = cur.cat
    return arr if !parent.present?
    return getparents(parent) + [parent]
  end

end