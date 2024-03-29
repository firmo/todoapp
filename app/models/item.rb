class Item < ActiveRecord::Base
  belongs_to :list

  validates :description, :presence => true
  validates :list, :presence => true
end
