class Post < ActiveRecord::Base

  belongs_to :user
	has_many :comments, dependent: :destroy
  validates :title, presence: true, length: { minimum: 5 }

  accepts_nested_attributes_for :comments

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  
end
