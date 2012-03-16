class Context < Sequel::Model
  many_to_many :tasks
end
