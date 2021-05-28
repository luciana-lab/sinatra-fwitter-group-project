class User < ActiveRecord::Base
  has_secure_password
  has_many :tweets
  validates :email, :password, presence: true
  validates :username, uniqueness: true

  def slug
    username.downcase.gsub(" ", "-")
  end

  def self.find_by_slug(slug)
    User.all.find {|username| username.slug == slug}
  end
end
