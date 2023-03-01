class MissionsController < ApplicationController
rescue_from ActiveRecord::RecordInvalid, with: :invalid 

def create 
    mission = Mission.create!(mission_params)
    # render json: mission, status: :created
    render json: mission.planet, status: :created
end


private
def invalid(e)
    render json: {errors: e.record.errors.full_messages}, status: :unprocessable_entity
end

def mission_params
     params.permit(:name, :scientist_id, :planet_id)
end

end
