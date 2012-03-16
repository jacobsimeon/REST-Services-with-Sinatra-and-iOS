FactoryGirl.define do

  factory :project do
    sequence :name do |i| 
      "Task ##{i}"
    end
  end

  factory :task do
    sequence :name do |i| 
      "Task ##{i}"
    end
  end

  factory :context do
    sequence :name do |i| 
      "Task ##{i}"
    end
  end

end
