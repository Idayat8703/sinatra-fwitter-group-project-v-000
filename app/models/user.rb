class User < ActiveRecord::Base
  has_secure_password
  has_many :tweets
  validates_presence_of :username, :email, :password

  def slug
    username.chomp.gsub(' ', '-').downcase
  end

  def self.find_by_slug(slug)
    all.find do |user|
      user.slug == slug
    end
  end
end
