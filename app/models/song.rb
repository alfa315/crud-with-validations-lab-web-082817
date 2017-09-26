class Song < ActiveRecord::Base
  validates :title, :artist_name, presence: true

  validates :title, uniqueness: {scope: :artist_name}


  validates :released, inclusion: {in:[true, false]}

  validates_numericality_of :release_year, :less_than_or_equal_to => Time.current.year, unless: Proc.new {|a| a.released == false}

  # validates :release_year, presence: true, unless: Proc.new {|a| a.released == false}

  # validate :released_prior?
  #
  # def released_prior?
  #   if release_year
  #     if self.release_year > Time.current.year
  #       self.errors[:release_year] << "Release year cannot occur in the future"
  #     else
  #       return
  #     end
  #   end
  # end

end
