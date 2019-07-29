module Set_Tweeet
  extend ActiveSupport::Concern

  included do
    before_action :set_tweeet, only: %i(show edit update destroy)

  end

  private
  def set_tweeet
    @tweeet = Tweeet.find_by(id: params[:id])
  end
end