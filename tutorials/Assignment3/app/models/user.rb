class User < ApplicationRecord
  #include Filterable
  def self.search(key, value)
      where("#{key} LIKE ?", "%#{value}%")
  end
end
