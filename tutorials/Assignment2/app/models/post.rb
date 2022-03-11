class Post < ApplicationRecord
  validates :title, presence: true

  def self.to_csv
    CSV.generate do |csv|
      csv << column_names
      all.each do |post|
        csv << post.attributes.values_at(*column_names)
      end
    end
  end

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      posts_hash = row.to_hash
      post = find_or_create_by!(title: posts_hash["title"], description: posts_hash["description"], status: posts_hash["status"])
    end
  end
end
