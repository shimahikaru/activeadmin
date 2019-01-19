class AdminUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable
  has_many :projects

  after_create :create_action
  binding.pry
  private

 def create_action
  binding.pry
 end
end
