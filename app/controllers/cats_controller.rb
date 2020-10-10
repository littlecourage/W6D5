class CatsController < ApplicationController 

    def index
        @cats = Cat.all
        render :index 
    end

    def show
        @cat = Cat.find(params[:id])
        render :show
    end

    def new
        @cat = Cat.new 
        render :new
    end

    def create
        cat = Cat.new(cat_params)
        if cat.update(cat_params)
            redirect_to cat_url(cat)
        else
            render json: cat.errors.full_messages, status: :unprocessable_entity
        end 

    end

    def edit
        @cat = Cat.find(params[:id])
        render :edit
    end

    def update
        cat = Cat.find_by(id: params[:id])
        if cat.update(cat_params) # this is using the ActiveRecord update method 
            redirect_to cat_url(cat)
        else
            render json: cat.errors.full_messages, status: :unprocessable_entity
        end
    end

    private
    def cat_params 
        params.require(:cat).permit(:birth_date, :name, :color, :sex, :description)
    end
end 