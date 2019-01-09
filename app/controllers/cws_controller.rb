class CwsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    render html: "index page"
  end

  def create
    puts params.to_s
    render status: 200, json: params
  end
end
