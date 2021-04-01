class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre

  def get_genre_name
    genre_name = Genre.all
    new_var = genre_name.map do |element|
       element.name
     
      end
      new_var[0]
  end

  def drake_made_this
    # when this method is called it should assign the song's artist to Drake
    # Drake doesn't exist in the database as an artist yet, so you'll have to create a record
    # Hint: you won't want to create an artist record every time this method is called, only if an Drake is *not found*
    # if @artist
    #   binding.pry
    #   Genre.all_artist_names
     

    # else
      
      a = Artist.all.select { |element| element.name == "Drake" }
      if a == []
        new_artist = Artist.create(:name=> "Drake")
        self.artist = new_artist
      else
        # binding.pry
        self.artist = a[0] 
      end
    # end
  end
end