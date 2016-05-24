json.array!(@pets) do |pet|
  json.extract! pet, :id, :name, :breed, :hair, :age, :gender, :size, :description, :status
  json.url pet_url(pet, format: :json)
end
