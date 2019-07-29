module Params
  extend ActiveSupport::Concern

  private

  def tweeet_params
    params.require(:tweeet).permit(:tweeet)
  end
end