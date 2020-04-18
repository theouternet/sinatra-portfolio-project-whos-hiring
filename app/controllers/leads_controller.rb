class LeadsController < ApplicationController

    get '/leads' do
        if logged_in?
            erb :'/leads/leads'
        else
            redirect '/login'
        end
    end

    get '/leads/new' do
        if logged_in?
            erb :'/leads/new'
        else
            redirect '/login'
        end
    end

    post '/leads' do
        lead = current_user.leads.build(params)
        if lead.save
            redirect to "/leads/#{lead.id}"
        else
            redirect to '/leads/new'
        end
    end

    get '/leads/:id' do
        if logged_in?
            @lead = Lead.find_by_id(params[:id])
            erb :'/leads/show_leads'
        else
            redirect '/login'
        end
    end
    
    
    get '/leads/:id/edit' do
        if logged_in?
            @lead = Lead.find_by_id(params[:id])
            if @lead.user_id == current_user.id
                erb :'/leads/edit_leads'
            else
                redirect "/leads/#{@lead.id}"
            end
        else
            redirect '/login'
        end
    end

    patch '/leads/:id' do
        @lead = Lead.find_by_id(params[:id])
        if @lead.user_id == current_user.id
            @lead.company = params[:company]
            @lead.company_website = params[:company_website]
            @lead.company_affiliation = params[:company_affiliation]
            @lead.bootcamp_grad_job_titles = params[:bootcamp_grad_job_titles]
            @lead.hiring_manager_name = params[:hiring_manager_name]
            @lead.hiring_manager_job_title = params[:hiring_manager_job_title]
            @lead.willing_to_consider_referral = params[:willing_to_consider_referral]
            @lead.willing_to_consider_informational_interview = params[:willing_to_consider_informational_interview]
            @lead.preferred_method_of_contact = params[:preferred_method_of_contact]
            @lead.notes = params[:notes]
            @lead.company = params[:company]

            @lead.save
            redirect "/leads/#{@lead.id}"
            else
            redirect "/leads/#{@lead.id}"
        end
        
    end

    delete '/leads/:id' do
        lead = Lead.find_by_id(params[:id])
        if lead.user_id == current_user.id
            lead.destroy
            redirect "/leads"
        else
            redirect "/leads/#{lead.id}"
        end
    end

end