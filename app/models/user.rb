class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
validates :password, format: { with: /\A[a-z0-9]+\z/i }
validates :nickname, presence: true
validates :birth_date, presence: true
validates :first_name, presence: true
validates :family_name, presence: true
validates :family_name_kana, presence: true
validates :first_name_kana, presence: true
end
