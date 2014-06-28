# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
ClassifiedCategory.create(name: 'Category 1', icon: 'placeholder')
ClassifiedCategory.create(name: 'Category 2', icon: 'placeholder')
ClassifiedCategory.create(name: 'Category 3', icon: 'placeholder')
ClassifiedCategory.create(name: 'Category 4', icon: 'placeholder')
ClassifiedCategory.create(name: 'Category 5', icon: 'placeholder')
ClassifiedCategory.create(name: 'Category 6', icon: 'placeholder')
ClassifiedCategory.create(name: 'Category 7', icon: 'placeholder')
ClassifiedCategory.create(name: 'Category 8', icon: 'placeholder')

ClassifiedPost.create(title: 'This is a title for post 1',description: 'This is a really really really really really good description',image: 'none',  price: 19.99,classified_category_id: 1)
ClassifiedPost.create(title: 'This is a title for post 2',description: 'This is a really really really really really good description',image: 'none',  price: 19.99,classified_category_id: 2)
ClassifiedPost.create(title: 'This is a title for post 3',description: 'This is a really really really really really good description',image: 'none',  price: 19.99,classified_category_id: 3)
ClassifiedPost.create(title: 'This is a title for post 4',description: 'This is a really really really really really good description',image: 'none',  price: 19.99,classified_category_id: 4)
ClassifiedPost.create(title: 'This is a title for post 5',description: 'This is a really really really really really good description',image: 'none',  price: 19.99,classified_category_id: 5)
ClassifiedPost.create(title: 'This is a title for post 6',description: 'This is a really really really really really good description',image: 'none',  price: 19.99,classified_category_id: 6)
ClassifiedPost.create(title: 'This is a title for post 7',description: 'This is a really really really really really good description',image: 'none',  price: 19.99,classified_category_id: 7)
ClassifiedPost.create(title: 'This is a title for post 8',description: 'This is a really really really really really good description',image: 'none',  price: 19.99,classified_category_id: 8)