# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
ClassifiedCategory.delete_all
ClassifiedCategory.create(name: 'Category 1', icon: 'placeholder')
ClassifiedCategory.create(name: 'Category 2', icon: 'placeholder')
ClassifiedCategory.create(name: 'Category 3', icon: 'placeholder')
ClassifiedCategory.create(name: 'Category 4', icon: 'placeholder')
ClassifiedCategory.create(name: 'Category 5', icon: 'placeholder')
ClassifiedCategory.create(name: 'Category 6', icon: 'placeholder')
ClassifiedCategory.create(name: 'Category 7', icon: 'placeholder')
ClassifiedCategory.create(name: 'Category 8', icon: 'placeholder')

ClassifiedPost.delete_all
i=0
30.times do
  post = ClassifiedPost.new(title: 'This is a title for post '+i.to_s,description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce eget mi in elit feugiat faucibus. Sed at feugiat ante. Aenean in velit at arcu pretium ultricies. Ut id porta diam. Suspendisse semper at est ac dictum.',  price: 19.99,classified_category: ClassifiedCategory.first, user: User.first, expiry: Time.now)
  post.image = File.open(Rails.root.to_s + '/db/sample.png')
  post.save!
  i+=1
end
