class ZipcodesController < ApplicationController

  def index
    @zipcode = Zipcode.new
  end

  def search
    @zipcode = Zipcode.find_by_code(params[:code])
    if @zipcode
      redirect_to "/#{@zipcode.state.slug}/#{'%2d' % @zipcode.congressional_district.number}"
    else
      flash[:notice] = "Zipcode not found, try again"
      render :index
    end
  end
end
