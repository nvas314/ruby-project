class UsersController < ApplicationController
  def index
    @list = User.all
  end
end
