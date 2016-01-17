class User < ActiveRecord::Base
  validates :name, presence: true
  validates :fianceeName, presence: true
  validates :email, email_format: { message: "That doesn't look like an email address" }, uniqueness: true
  validates_format_of :wedDate, :with => /\d{2}\/\d{2}\/\d{4}/, :message => "^Date must be in the following format: mm/dd/yyyy", presence: true

  has_secure_password
end



