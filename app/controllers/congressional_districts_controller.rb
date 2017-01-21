class CongressionalDistrictsController < ApplicationController
  before_filter :find_state
  before_filter :find_cd, only: [:show]

  def show
    @grants = @congressional_district.grants
  end

  def find_state
    @state = State.friendly.find(params[:state_slug])
    unless @state
      flash[:notice] = "State not found: #{params[:state_slug]}"
      redirect_to root_url
    end
  end

  def find_cd
    @congressional_district = @state.congressional_districts.where(number: params[:congressional_district_number]).first
    unless @state
      flash[:notice] = "Congressional District: #{params[:congressional_district_number]} not found in #{@state.name}"
      redirect_to root_url
    end
  end
end
