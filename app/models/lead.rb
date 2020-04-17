class Lead < ActiveRecord::Base
    belongs_to :user
    validates_presence_of :company, :company_website, :company_affiliation, :bootcamp_grad_job_titles, :hiring_manager_name(s), :hiring_manager_job_title(s)

    t.string :company
    t.string :company_website
    t.string :company_affiliation
    t.string :bootcamp_grad_job_titles
    t.string :hiring_manager_name(s)
    t.string :hiring_manager_job_title(s)
    t.string :confirmed_hiring_now?
    t.string :willing_to_consider_referral?
    t.string :willing_to_consider_informational_interview?
    t.string :referrer_name
    t.string :referrer_email
    t.string :notes
  end