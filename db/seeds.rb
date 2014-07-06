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
100.times do
  post = ClassifiedPost.new(title: 'This is a title for post 1',description: 'This is a really really really really really good description',  price: 19.99,classified_category_id: Random.rand(8))
  post.image = File.open('/home/kevin/Downloads/niccage.jpg')
  post.save!
end
