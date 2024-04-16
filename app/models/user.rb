class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
has_one :cart
         belongs_to :province
         validates :email, presence: true, uniqueness: true
         validates :province_id, presence: true
end
