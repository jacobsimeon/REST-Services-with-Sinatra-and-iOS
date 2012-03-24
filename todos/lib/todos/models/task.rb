class Task < Sequel::Model
  def validate
    super
    validates_presence :name
  end
end
