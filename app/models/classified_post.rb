class ClassifiedPost < ActiveRecord::Base
  include PgSearch
  belongs_to :classified_category
  belongs_to :user
  has_many :comments

  #possible filters
  # scope :price_upper, -> (price_lower) { where location_id: location_id }
  # scope :price_lower, -> (price_upper) { where }
  scope :category, -> (category) {where classified_category_id: category}
  pg_search_scope :search_text, :against => [:title, :author,:isbn]
  scope :price_low, -> (price_low) { where("price > ?", price_low)}
  scope :price_high, -> (price_high) { where("price < ?", price_high)}
  scope :current, -> {where("expiry > ?", Time.now)}
  scope :recent, -> {order('created_at DESC')}
  scope :sort_high, -> {order('price DESC')}
  scope :sort_low, ->{order('price ASC')}
  # validations
  validates :description,:title,:price,:author,:isbn, :user_id, :classified_category_id, presence: true
  validates :terms, acceptance: true

  validates_numericality_of :price, :greater_than => 0, :less_than => 10000
  self.per_page = 21

  validates :title, length: { minimum: 5,maximum: 40 }

  #paperclip stuff
  has_attached_file :image,
                    :styles => { :thumb => "100x100>", :small => "250x250" ,:large => "500x500"},
                    :default_url => "/assets/:style/missing.gif"
  validates_attachment_content_type :image, :content_type => ['image/jpeg', 'image/jpg', 'image/png']
end
