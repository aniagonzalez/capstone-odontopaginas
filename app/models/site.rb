class Site < ActiveRecord::Base
  has_many :gallery_pictures
  has_many :team_members
  has_many :treatments
  has_many :testimonials
  belongs_to :user
  has_one :json_datum

  after_create :create_json_datum

  def create_json_datum
     JsonDatum.create(site_id: self.id)
  end
end
