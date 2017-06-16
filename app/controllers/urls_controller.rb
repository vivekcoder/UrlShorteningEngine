class UrlsController < ApplicationController
  before_action :find_url, only: [:show, :shortened]

  def new
    @url = Url.new
  end

  def show
    redirect_to @url.sanitized
  end

  def create
    @url = Url.new(url_params)
    @url.sanitize
    if @url.new_url?
      if @url.save!
        redirect_to shortened_path(@url.short)
      else
        render 'new'
      end
    else
      redirect_to shortened_path(@url.find_duplicate.short)
    end
  end

  def shortened
  	# redirect_to @url.sanitized
  end

  private

  def find_url
    @url = Url.find_by(short: params[:short])
  end

  def url_params
    params.require(:url).permit(:original)
  end
end