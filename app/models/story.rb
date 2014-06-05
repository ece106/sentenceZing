class Story < ActiveRecord::Base
  include PublicActivity::Common
  
  has_many :microposts
  belongs_to :user
  has_many :likes

  accepts_nested_attributes_for :likes, allow_destroy: true
  
  validates :title, :uniqueness => true

#  has_and_belongs_to_many :users
#  accepts_nested_attributes_for :microposts 

  def feed
    # This is preliminary. See "Following users" for the full implementation.
    Micropost.where("story_id = ?", id)
  end

end
