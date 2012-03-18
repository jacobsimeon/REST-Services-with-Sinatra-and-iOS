class Project < Sequel::Model

  one_to_many :tasks

  def validate
    super
    validates_presence :name
  end

  def before_destroy
    tasks.each { |t| t.destroy }
  end

end
