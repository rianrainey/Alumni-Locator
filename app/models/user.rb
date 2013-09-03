class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :user_id, :email, :password, :password_confirmation, :remember_me, :contact_info_attributes

  has_one :contact_info

  accepts_nested_attributes_for :contact_info

  #after_create { |user| user.send_reset_password_instructions }
  
  def password_required?
    new_record? ? false : super
  end
end
