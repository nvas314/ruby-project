class HomeController < ApplicationController
    def index
      @articles = Article.all
      @current_user = User.find_by_id(session[:user_id]) #<%= @current_user.username %>
    end
  
end
