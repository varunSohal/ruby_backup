class AboutController < ApplicationController

  def index
    @about = About.all
  end

  def show
    @about_page = About.first
  end
end
