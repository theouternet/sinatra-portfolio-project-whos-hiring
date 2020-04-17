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
            erb :'/leads/show_lead'
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
            if @lead.update(content: params[:content])
                redirect "/leads/#{@lead.id}"
            else
                redirect "/leads/#{@lead.id}/edit" #reloads edit form if content blank
            end
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