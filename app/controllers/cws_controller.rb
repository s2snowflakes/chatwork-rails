class CwsController < ApplicationController
  def index
    render html: "index page"
  end

  def create
    puts params.to_s
  end
end
