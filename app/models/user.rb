class User < ActiveRecord::Base


  has_many :posts, 	dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

before_save { self.email = email.downcase }

validates :username, presence: true
validates :name,  presence: true, length: { maximum: 50 }      
end
