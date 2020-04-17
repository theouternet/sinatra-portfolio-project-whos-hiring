class Lead < ActiveRecord::Base
    belongs_to :user
    validates_presence_of :company, :company_website, :company_affiliation, :bootcamp_grad_job_titles, :hiring_manager_name(s), :hiring_manager_job_title(s)
  end