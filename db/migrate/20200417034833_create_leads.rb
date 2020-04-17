class CreateLeads < ActiveRecord::Migration[5.2]
  def change
    create_table :leads do |t|
      t.string :company
      t.string :company_website
      t.string :company_affiliation
      t.string :bootcamp_grad_job_titles
      t.string :hiring_manager_name(s)
      t.string :hiring_manager_job_title(s)
      t.string :willing_to_consider_referral?
      t.string :willing_to_consider_informational_interview?
      t.string :referrer_name
      t.string :referrer_email
      t.string :notes
    end
  end
end
