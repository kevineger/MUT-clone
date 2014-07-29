class ClassifiedPost < ActiveRecord::Base
  belongs_to :classified_category
  belongs_to :user

  #possible filters
  scope :status, -> (status) { where status: status }
  scope :price_upper, -> (price_lower) { where location_id: location_id }
  scope :price_lower, -> (price_upper) { where }
  scope :category, -> (category_id) {where category_id: category_id}
  scope :search, -> (title) { where("title like ?", "#{title}%")}
  self.per_page = 21
  has_attached_file :image,
                    :styles => { :thumb => "100x100>", :small => "250x250" ,:large => "500x500"},
                    :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
