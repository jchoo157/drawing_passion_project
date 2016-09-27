require 'bcrypt'

class User < ActiveRecord::Base
  # Remember to create a migration!
  include BCrypt

  has_many :drawings
  has_many :comments

  validates :email, presence: true
  validates :email, uniqueness: true
  validates :password, presence: true

  def password
    @password ||= Password.new(hashed_password)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.hashed_password = @password
  end

  def self.authenticate(email, password)
    @user = User.find_by(email: email)
    return nil if @user == nil
    
    if @user.password == password
      return @user
    else
      return nil
    end
  end
end
