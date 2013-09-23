class Post < ActiveRecord::Base
	has_many :comments, dependent: :destroy
  validates :title, presence: true, length: { minimum: 5 }

  accepts_nested_attributes_for :comments
  
end
