# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.delete_all
user = User.new(
    :email                 => "admin@admin.com",
    :password              => "password",
    :password_confirmation => "password",
    :forem_admin => true
)
user.skip_confirmation!
user.save!
user = User.new(
    :email                 => "user1@user.com",
    :password              => "password",
    :password_confirmation => "password",
    :forem_admin => true
)
user.skip_confirmation!
user.save!
user = User.new(
    :email                 => "user2@user.com",
    :password              => "password",
    :password_confirmation => "password",
    :forem_admin => true
)
user.skip_confirmation!
user.save!
user = User.new(
    :email                 => "user3@user.com",
    :password              => "password",
    :password_confirmation => "password",
    :forem_admin => true
)
user.skip_confirmation!
user.save!

ClassifiedCategory.delete_all
ClassifiedCategory.create(name: 'Computer Science', icon: 'placeholder')
ClassifiedCategory.create(name: 'Biology', icon: 'placeholder')
ClassifiedCategory.create(name: 'Chemistry', icon: 'placeholder')
ClassifiedCategory.create(name: 'Human Kinetics', icon: 'placeholder')
ClassifiedCategory.create(name: 'Nursing', icon: 'placeholder')
ClassifiedCategory.create(name: 'Engineering', icon: 'placeholder')
ClassifiedCategory.create(name: 'Pharmacy', icon: 'placeholder')
ClassifiedCategory.create(name: 'Sculpting', icon: 'placeholder')

ClassifiedPost.delete_all
i=0
images = ['/db/images/chemistry.jpg','/db/images/engineering.jpg','/db/images/hkin.jpg','/db/images/math1700.jpg','/db/images/nursing.jpg','/db/images/pharmacy.jpeg','/db/images/pilates.jpg']
30.times do
  image = images.sample
  post = ClassifiedPost.new(title: 'This is a title for post '+i.to_s,description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce eget mi in elit feugiat faucibus. Sed at feugiat ante. Aenean in velit at arcu pretium ultricies. Ut id porta diam. Suspendisse semper at est ac dictum.',
                            price: (20 + Random.rand(10000)/100),classified_category: ClassifiedCategory.order("RANDOM()").first, user: User.order("RANDOM()").first, expiry: 30.days.from_now)
  post.image = File.open(Rails.root.to_s + image)
  post.save!
  i+=1
end
