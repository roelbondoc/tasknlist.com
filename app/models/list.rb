class List < ActiveRecord::Base
  has_many :tasks

  def before_create
    self.title = 'Things to do...'
    found = false
    while !found
      self.permalink = (0...3).map{ (('a'..'z').to_a | ('A'..'Z').to_a)[rand(52)] }.join + 
                       (0...3).map{ (0..9).to_a[rand(10)] }.join
      found = !List.find_by_permalink(self.permalink)
    end
  end
end
