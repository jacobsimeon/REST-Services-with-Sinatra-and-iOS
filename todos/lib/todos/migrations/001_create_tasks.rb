Sequel.migration do
  up do
    create_table(:tasks) do
      primary_key :id
      String :name, :null=>false
      String :description
      Integer :priority
      Boolean :is_complete
    end
  end
  down do
    drop_table(:tasks)
  end
end
