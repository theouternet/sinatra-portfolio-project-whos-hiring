class UsersController < ApplicationController

    get '/signup' do
        if logged_in?
            redirect '/leads'
        else
            erb :"users/create_user"
        end
    end

    post '/signup' do
        user = User.new(params)
        if user.save
            session[:user_id] = user.id
            redirect '/leads'
        else
            redirect '/signup'
        end
    end

    get '/login' do
        if logged_in?
            redirect '/leads'
        else
            erb :'/users/login'
        end
    end

    post '/login' do
        user = User.find_by(:username => params[:username])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect '/leads'
        else
            redirect '/login'
        end
    end

    get "/logout" do
        if logged_in?
            session.clear
            redirect "/login"
        else
            redirect "/"
        end
      end

    get '/users/:slug' do
        @user = User.find_by_slug(params[:slug])
        erb :"users/show"
    end

end