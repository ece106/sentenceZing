class User < ActiveRecord::Base
  has_many :microposts, dependent: :destroy
  has_many :relationships, foreign_key: "follower_id", dependent: :destroy
  has_many :followed_users, through: :relationships, source: :followed
  acts_as_messageable
 
  has_many :reverse_relationships, foreign_key: "followed_id",
                                   class_name:  "Relationship",
                                   dependent:   :destroy
  has_many :followers, through: :reverse_relationships, source: :follower

  has_many :likes

  has_many :stories
  mount_uploader :image, ImageUploader
  mount_uploader :banner, ImageUploader

#  has_and_belongs_to_many :stories

  before_save { self.email = email.downcase }
  before_create :create_remember_token
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence:   true,
                    format:     { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, length: { minimum: 6 }
  validates_acceptance_of :terms_of_service
  
  validates :name, :uniqueness => true
  
  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.hash(token)
    Digest::SHA1.hexdigest(token.to_s)
  end
  
  def feed
    # This is preliminary. See "Following users" for the full implementation.
    # Micropost.where("user_id = ?", id)
    Micropost.from_users_followed_by(self)
  end
  
   #the following? method takes in a user, called other_user, and checks to see if a followed user with that id exists in the database

   def following?(other_user)
    relationships.find_by(followed_id: other_user.id)
  end # end of method following?
 
 # the follow! method calls create! through the relationships association to create the following relationship
  def follow!(other_user)
    relationships.create!(followed_id: other_user.id)
  end # end of method follow!
  
  def unfollow!(other_user)
    relationships.find_by(followed_id: other_user.id).destroy
  end
  
  def likes!(likable_object)
    unless likable_object.likes.where(:user_id => self.id).exists?
      like = likable_object.likes.build(:user_id => self.id)
      like.save
    end
  end

  private

    def create_remember_token
      self.remember_token = User.hash(User.new_remember_token)
    end
end
