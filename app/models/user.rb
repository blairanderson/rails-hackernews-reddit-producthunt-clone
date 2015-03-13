class User < ActiveRecord::Base
  authenticates_with_sorcery!

  before_create do
    begin
      self.token = SecureRandom.hex
    end while self.class.exists?(token: token)
  end


  validates :password, length: { minimum: 5 }
  validates :password, confirmation: true
  validates :password_confirmation, presence: true

  validates :username, uniqueness: true, length: {minimum: 2}

  has_many :items
  has_many :votes
  has_many :item_comments

  def item_votes
    votes.where(votable_type: "Item")
  end

  def to_param
    username.downcase
  end

  def username
    disabled? ? "[deleted]" : read_attribute(:username).downcase
  end

end
