class AddFirstAndLastnameColumnsToPersonas < ActiveRecord::Migration[4.2]
  def change
    if table_exists?(:masq_personas) && !column_exists?(:masq_personas, :firstname)
      add_column :masq_personas, :firstname, :string
    end

    if table_exists?(:masq_personas) && !column_exists?(:masq_personas, :surname)
      add_column :masq_personas, :surname, :string
    end
  end
end
