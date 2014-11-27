class AddPartnerToEnrolment < ActiveRecord::Migration
  def change
    add_column :enrolments, :partner, :integer
  end
end
