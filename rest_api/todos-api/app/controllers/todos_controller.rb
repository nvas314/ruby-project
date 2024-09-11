class TodosController < ApplicationController
    before_action :set_todo, only: [:show, :update, :destroy]
  
    # GET /todos
    def index
      @todos = Todo.where(created_by:session[:user_id])
      json_response(@todos)
    end
  
    # POST /todos
    def create
      @todo = Todo.create!(title:params[:title],created_by:session[:user_id])
      json_response(@todo, :created)
    end
  
    # GET /todos/:id
    def show  
      json_response(@todo)
    end
  
    # PUT /todos/:id
    def update
      @todo.update(todo_params)
      head :no_content
    end
  
    # DELETE /todos/:id
    def destroy
      @todo.destroy
      head :no_content
    end
  
    private
  
    def todo_params
      # whitelist params
      params.permit(:title)
    end
  
    def set_todo
      @todo = Todo.find(params[:id])
    end
  end