class Artist < ActiveRecord::Base
  has_many :concerts
  belongs_to :user

  validates :name, :user, presence: true
end
