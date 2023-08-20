class V1::ApiController < ApplicationController
  def default_sort
    'created_at desc'
  end
end
