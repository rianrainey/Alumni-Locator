class AddUndergradSchoolAndUndergradGradYearToContactInfo < ActiveRecord::Migration
  def change
    add_column :contact_infos, :undergrad_school, :string
    add_column :contact_infos, :undergrad_grad_year, :integer
  end
end
