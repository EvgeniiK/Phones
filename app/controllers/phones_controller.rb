class PhonesController < ApplicationController
  def create
    if params['first_part'] && params['second_part'] && params['third_part']
      render json: PhoneNumber.generate_specific(params['first_part'],params['second_part'],params['third_part']), status: :ok
    else
      render json: PhoneNumber.generate, status: :ok
    end
  end

  private

  def permitted_params
    params.permit(:first_part, :second_part, :third_part)
  end
end
