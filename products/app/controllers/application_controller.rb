class ApplicationController < ActionController::API
  # Handle exceptions in controllers
  rescue_from ActiveRecord::RecordNotSaved, with: :not_saved
  rescue_from ActiveRecord::RecordNotDestroyed, with: :not_destroyed


  private

  def self.not_saved(e)
    render json: { errors: e.record.errors }, status: :unprocessable_entity
  end

  def self.not_destroyed(e)
    render json: { errors: e.record.errors }, status: :unprocessable_entity
  end
end
