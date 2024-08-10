class CreateContacts < ActiveRecord::Migration[7.1]
  def change
    create_table :contacts do |t|
      t.string :candidate_name
      t.string :father_name
      t.string :college
      t.string :course_interest
      t.string :email_id
      t.string :phone_number
      t.text :query

      t.timestamps
    end
  end
end
