class Admin < ApplicationRecord
  enum role: [:admin, :contributor]

  validates :user_name, presence: true, length: { minimum: 4, maximum: 10 }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
