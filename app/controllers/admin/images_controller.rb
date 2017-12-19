class Admin::ImagesController < Admin::BaseController
  def index
  end

  def new
    @image = Image.new
  end
end
