class ClassifiedPost < ActiveRecord::Base
  belongs_to :classified_category
  belongs_to :user

  self.per_page = 21

  has_attached_file :image, :bucket => 'mut-heroku-rails-paperclip',
                    :s3_credentials => Proc.new{|a| a.instance.s3_credentials },
                    :styles => { :medium => "300x300>" ,:large => "500x500"},
                    :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  def s3_credentials
    {:bucket => "mut-heroku-rails-paperclip", :access_key_id => "AKIAJ6FF7BNRUTRX2D3A", :secret_access_key => "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"}
  end
end
