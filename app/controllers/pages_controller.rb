# frozen_string_literal: true

class PagesController < InheritedResources::Base
  http_basic_authenticate_with name: 'admin', password: 'admin', except: :permalink

  def permalink
    @page = Page.find_by_permalink(params[:permalink])

    if @page
      render :show # /app/views/pages/show.html.erb
    else
      redirect_to root_path
    end
  end

  def index
    @pages = Page.all
  end

  def page_params
    params.require(:page).permit(:title, :content, :permalink)
  end
end
