class Task < ActiveRecord::Base
  belongs_to :list

  default_scope :order => 'title'
end
