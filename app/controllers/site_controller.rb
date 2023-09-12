class SiteController < AuthController
  before_action :set_counter, only: [:index]

  def index
    @counter = session[:counter]
  end

  def add
    @counter = session[:counter] += 1
  end

  def remove
    @counter = session[:counter] -= 1
  end

  private
    def set_counter
      session[:counter] = 0
    end
end
