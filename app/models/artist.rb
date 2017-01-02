class Artist < ActiveRecord::Base
  has_many :concerts
  belongs_to :user

  validates :name, :user, presence: true

  def slug
    self.name.downcase.split(" ").join("-")
  end

  def self.find_by_slug(slug)
    Artist.all.detect(ifnone = "Can't find that artist") {|x| slug == x.slug}
  end
end
