class AdSerializer
  include JSONAPI::Serializer

  attributes :title,
             :description,
             :city,
             :lat,
             :lon,
             :user_id
end
