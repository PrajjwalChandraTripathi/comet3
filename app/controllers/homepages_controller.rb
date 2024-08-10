class HomepagesController < ApplicationController
    def index
      @items = HomepageItem.with_attached_image.select(:id, :title, :location, :link).all
    end
    def render_partial
      partial = params[:partial]
      render partial: partial
    end
end
  