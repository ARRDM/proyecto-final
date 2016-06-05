class Pet < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  belongs_to :user
  
  def self.search(search)
    if(search)
      where("name LIKE ?", "%#{search}%")
    else
      where("name LIKE ?", "%%")
    end
  end

  def self.ordena(pets,latitude,longitude)
    pets.sort_by { |x| x.user.distance_from([latitude,longitude]) }
  end

  def self.search_distance(pets,distancia,lat,lng)
    if(distancia)
      pets.select { |pet| (pet.user.distance_from([lat,lng]))*1.6 <= distancia.to_f }
    else
      pets
    end
  end

  def self.busqueda_avanzada(aname,abreed,ahair,aage,agender,asize, adescription)
    if aname == nil
      aname = ""
    end
    if abreed == nil
      abreed = ""
    end
    if ahair == nil
      ahair = ""
    end
    if aage == nil
      aage = ""
    end
    if agender == nil
      agender = ""
    end
    if asize == nil
      asize = ""
    end
    if adescription == nil
      adescription = ""
    end
  where("name LIKE ? AND breed LIKE ? AND hair LIKE ? AND age LIKE ? AND gender LIKE ? AND size LIKE ? AND description LIKE ?",
        "%#{aname}%",
        "%#{abreed}%",
        "%#{ahair}%",
        "%#{aage}%",
        "%#{agender}%",
        "%#{asize}%",
        "%#{adescription}%")
  end
end
