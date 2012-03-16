class Project < Sequel::Model
  plugin :json_serializer
  one_to_many :tasks
end
