class User < ActiveRecord::Base
  # Include default users modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :classified_posts
  attr_accessor :login
  validates :username, uniqueness: true
  has_and_belongs_to_many :conversations
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  def forem_name
    email
  end
  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      where(conditions).first
    end
  end
  has_attached_file :image,
                    :styles => { :default => "200x200"},
                    :default_url => "/assets/default.png"
  validates_attachment_content_type :image, :content_type => ['image/jpeg', 'image/jpg', 'image/png']
end
