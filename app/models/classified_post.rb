class ClassifiedPost < ActiveRecord::Base
  belongs_to :classified_category
  belongs_to :user
  has_many :comments

  #possible filters
  # scope :price_upper, -> (price_lower) { where location_id: location_id }
  # scope :price_lower, -> (price_upper) { where }
  scope :category, -> (category) {where classified_category_id: category}
  scope :search_text, -> (title) { where("LOWER(title) LIKE LOWER(?)", "%#{title}%")}
  scope :price_low, -> (price_low) { where("price > ?", price_low)}
  scope :price_high, -> (price_high) { where("price < ?", price_high)}
  scope :current, -> {where("expiry > ?", Time.now)}
  scope :recent, -> {order('created_at DESC')}
  scope :sort_high, -> {order('price DESC')}
  scope :sort_low, ->{order('price ASC')}
  # validations
  validates :description,:title,:price,:author,:isbn, :user_id, :classified_category_id, presence: true
  validates :terms, acceptance: true
  validates :price, :format => { :with => /\A\d+(?:\.\d{0,2})?\z/ }
  self.per_page = 21

  validates :title, length: { minimum: 5,maximum: 40 }

  #paperclip stuff
  has_attached_file :image,
                    :styles => { :thumb => "100x100>", :small => "250x250" ,:large => "500x500"},
                    :default_url => "/assets/:style/missing.gif"
  validates_attachment_content_type :image, :content_type => ['image/jpeg', 'image/jpg', 'image/png']
end
