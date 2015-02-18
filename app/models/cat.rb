class Cat < ActiveRecord::Base
  after_save :count_fold
  #default_scope { order("position asc") }
  scope :active, -> { where(:active => true)}
  scope :root, -> {where(:cat_id => 0)}
  has_many :cats, -> { order 'position asc' }
  belongs_to :cat
  has_many :tovars
  acts_as_list scope: :cat_id


  def children
    return getchildids([], self.id)
  end

  def parents
    getparents(self)
  end

  def childos
    return getchildren(self)[1..-1]
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
    #Cat.find(self.id).update_attributes(:fold => fold)
  end

  def getchildids(ids, id)
    cur = Cat.find(id)
    cur.cats.each do |one|
      ids = getchildids(ids, one.id)
    end
    return ids + [id]
  end


  def getchildren(cur, arr =[])
    arr += [cur]
    cur.cats.each do |one|
      arr = getchildren(one, arr)
    end
    return arr
  end

  def getparents(cur, arr = [])
    parent = cur.cat
    return arr if !parent.present?
    return getparents(parent) + [parent]
  end

end
