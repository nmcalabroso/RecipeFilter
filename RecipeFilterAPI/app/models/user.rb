class User < ActiveRecord::Base

  acts_as_authentic do |c|
    c.validate_email_field = false
    c.require_password_confirmation = false
  end

  has_many :recipes
end
