class PlantsController < ApplicationController
    wrap_parameters format: []
    #GET    /plants
    def index
        render json: Plant.all, status: :ok
    end

    #POST   /plants
    def create
        plant = Plant.create(plant_params)
        render json: plant, status: :created
    end
    
    #GET    /plants/:id
    def show
        plant = Plant.find_by(id: params[:id])
        if plant
            render json: plant, status: :ok
        else 
            render json: {error: "Couldn't find plant"}, status: :not_found
        end
    end

    private

    def plant_params
        params.permit(:name, :image, :price)
    end
end
