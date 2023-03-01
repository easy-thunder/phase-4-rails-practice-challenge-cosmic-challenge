class ScientistsController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :not_found
rescue_from ActiveRecord::RecordInvalid, with: :invalid


def index
    render json: Scientist.all, status: :ok
end

def show 
    scientist = Scientist.find_by!(id: params[:id])
     render json: scientist, serializer: ScientistShowSerializer, status: :ok
end

def create 
    scientist = Scientist.create!(scientist_params)
    render json: scientist, status: :created
end

def update 
    scientist = Scientist.find_by!(id: params[:id])
    scientist.update!(scientist_params)
    render json: scientist, status: :accepted
end

def destroy 
    Scientist.find_by!(id: params[:id]).destroy
end



private 
def scientist_params
params.permit(:name, :field_of_study, :avatar)
end


def not_found (e)
    render json: {errors: e}, status: :not_found
end

def invalid (e)
    render json: {errors: e.record.errors.full_messages}, status: :unprocessable_entity
end

end
