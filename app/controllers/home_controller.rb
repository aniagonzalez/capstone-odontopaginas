class HomeController < ApplicationController

  def index
    if current_user
      @sites = current_user.sites
    end
  end

  def render_json
    @site = Site.find(params[:id])
    render json: @site
  end

end
