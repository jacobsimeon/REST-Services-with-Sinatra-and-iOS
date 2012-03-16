class Task < Sequel::Model
  many_to_one :project
  many_to_many :contexts
end
