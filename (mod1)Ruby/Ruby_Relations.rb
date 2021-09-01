# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Many to Many
class ProjectBacker
    attr_reader :backer, :project
    @@all = []
    def initialize(project, backer)
        @backer = backer
        @project = project
        @@all << self
    end
    def self.all
        @@all
    end
end
class Backer
    attr_accessor :name
    @@all = []
    def initialize(name)
        @name = name
        @@all << self
    end
    def back_project(project)
        ProjectBacker.new(project, self)
    end
    def backed_projects
        ProjectBacker.all.select{ |pb| pb.backer == self  }.map{ |pb| pb.project }.compact
    end
    def self.all
        @@all
    end
end
class Project
    attr_accessor :title
    @@all = []
    def initialize(title)
        @title = title
        @@all << self
    end
    def backers
        ProjectBacker.all.select{ |pb| pb.project == self  }.map{ |pb| pb.backer }.compact
    end
    def add_backer(backer)
        ProjectBacker.new(self, backer)
    end
    def self.all
        @@all
    end
end

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#MP3 Importer collaborating with Songs

        class Song
          attr_accessor :title

          def self.new_by_filename(filename)
            song = self.new
            song.title = filename.split(" - ")[1]
            song
          end

        end

        class MP3Importer
          def import(list_of_filenames)
            list_of_filenames.each{ |filename| Song.new_by_filename(filename) }
          end
        end 


#Songs collaborating with Artists

        class Song
          attr_accessor :artist

          # other methods

          def artist_name=(name)
            if (self.artist.nil?)
              self.artist = Artist.new(name)
            else
              self.artist.name = name
            end
          end
        end

        class Artist
          attr_accessor :name

          def initialize(name)
            @name = name
          end

          # other methods

        end 
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~