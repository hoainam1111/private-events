class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :events, foreign_key: 'creator_id', dependent: :destroy
  has_many :attendances
  has_many :attendees, through: :attendances, source: :event
  # attendees là mối quan hệ với các người tham dự sự kiện thông qua bảng join.
end
