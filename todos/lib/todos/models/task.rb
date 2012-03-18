class Task < Sequel::Model
  many_to_one :project
  many_to_many :contexts
  def before_destroy
    contexts.each { |c| remove_context c }
  end
end
