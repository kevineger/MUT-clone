class User < ActiveRecord::Base
  # Include default users modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_and_belongs_to_many :conversations
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  def forem_name
    email
  end

end
