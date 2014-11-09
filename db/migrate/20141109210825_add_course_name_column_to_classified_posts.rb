class AddCourseNameColumnToClassifiedPosts < ActiveRecord::Migration
  def change
    add_column :classified_posts, :course_name, :string
  end
end
