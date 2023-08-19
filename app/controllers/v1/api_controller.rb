class V1::ApiController < ApplicationController

  def page
    params[:page] || 1
  end

  def per_page
    params[:per_page] || 20
  end

end
