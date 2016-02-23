class Post < ActiveRecord::Base
validates :title , presence: true, length: {maximum:50}
validates :description , presence: true, length: {maximum:500}

belongs_to :user
has_many :comments, dependent: :destroy
end
