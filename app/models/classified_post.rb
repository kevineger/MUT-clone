class ClassifiedPost < ActiveRecord::Base
  belongs_to :classified_category
  belongs_to :user

  self.per_page = 21

  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>", :small => "250x250" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
