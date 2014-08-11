class ClassifiedPost < ActiveRecord::Base
  belongs_to :classified_category
  belongs_to :user

  #possible filters
  # scope :price_upper, -> (price_lower) { where location_id: location_id }
  # scope :price_lower, -> (price_upper) { where }
  scope :category, -> (category) {where classified_category_id: category}
  scope :search_text, -> (title) { where("title like ?", "%#{title}%")}
  scope :price_low, -> (price_low) { where("price > ?", price_low)}
  scope :price_high, -> (price_high) { where("price < ?", price_high)}
  scope :recent, -> {order('created_at DESC')}
  scope :sort_high, -> {order('price DESC')}
  scope :sort_low, ->{order('price ASC')}
  # validations
  validates :description,:title,:price, :user_id, :classified_category_id, presence: true
  self.per_page = 21
  has_attached_file :image,
                    :styles => { :thumb => "100x100>", :small => "250x250" ,:large => "500x500"},
                    :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
