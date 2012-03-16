Sequel.migration do
  up do
    create_table(:contexts) do
      primary_key :id
      String :name, :null=>false
    end

    create_table(:contexts_tasks) do
      primary_key :id
      foreign_key :task_id, :tasks
      foreign_key :context_id, :contexts
    end

  end
  down do
    drop_table(:contexts)
    drop_table(:contexts_tasks)
  end
end
