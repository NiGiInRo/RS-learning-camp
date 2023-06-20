module Api
    extend ActiveSupport::Concern
    
  def success
    render json: { id: current_user.id, name: current_user.name, lastname: current_user.lastname, email: current_user.email }, status: :ok
  end

  def success_log_out
    render json: { message: "success log out"}, status: :unauthorized
  end

  def failure
    render json: { message: "Error"}, status: :unauthorized
  end

end