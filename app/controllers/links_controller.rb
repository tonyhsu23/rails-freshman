require 'uri'
class LinksController < ApplicationController

  before_action :login_required, only: [:new, :create]

  def index
    
    case params[:tag]
      when 'gem'
        @links = Link.where("tag=?", "Gem").order('created_at desc')
      when 'news' 
        @links = Link.where("tag=?", "News").order('created_at desc') 
      when 'teach'
        @links = Link.where("tag=?", "Teaching").order('created_at desc') 
      when 'discuss'
        @links = Link.where("tag=?", "Discussion").order('created_at desc')
      else
        @links = Link.all.order('created_at desc')
    end    
  	
  end

  def new
  	@link = Link.new
  end

  def create
  	
    @link = Link.new(url: params[:link][:url], tag: params[:link][:tag], 
      title: URI.decode(params[:title]), content: URI.decode(params[:description]), 
      thumbnail: URI.decode(params[:thumbnail_url]))

  	if @link.save
  	  redirect_to links_path
  	else
  	  render :index
  	end

  end


  private

  def link_params()
  	params.require(:link).permit(:url, :tag, :title, :content, :thumbnail)
  end

end
