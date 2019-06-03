class Song < ActiveRecord::Base
  has_many :song_genres
  has_many :genres, through: :song_genres
  belongs_to :artist

  def slug
    self.name.downcase.gsub(/[^0-9A-Za-z]/, '-')
  end

  def self.find_by_slug(slug)
    self.all.find do |song|
      song.slug == slug
    end 
  end


end
