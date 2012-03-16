Sequel.migration do
  up do
    create_table(:tasks) do
      primary_key :id
      foreign_key :project_id, :projects
      String :name, :null=>false
    end
  end
  down do
    drop_table(:tasks)
  end
end
