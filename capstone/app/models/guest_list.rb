class GuestList < ActiveRecord::Base
  belongs_to :user

  validates :name, presence: true
  validates :relationship, presence: true
  validates :email, email_format: { message: "That doesn't look like an email address" }, allow_blank: true
end
