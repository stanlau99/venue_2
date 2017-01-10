class VenuedishesController < ApplicationController
  def index
    @q = Venuedish.ransack(params[:q])
    @venuedishes = @q.result(:distinct => true).includes(:dish, :venue).page(params[:page]).per(10)

    render("venuedishes/index.html.erb")
  end

  def show
    @venuedish = Venuedish.find(params[:id])

    render("venuedishes/show.html.erb")
  end

  def new
    @venuedish = Venuedish.new

    render("venuedishes/new.html.erb")
  end

  def create
    @venuedish = Venuedish.new

    @venuedish.venueid = params[:venueid]
    @venuedish.dishid = params[:dishid]

    save_status = @venuedish.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/venuedishes/new", "/create_venuedish"
        redirect_to("/venuedishes")
      else
        redirect_back(:fallback_location => "/", :notice => "Venuedish created successfully.")
      end
    else
      render("venuedishes/new.html.erb")
    end
  end

  def edit
    @venuedish = Venuedish.find(params[:id])

    render("venuedishes/edit.html.erb")
  end

  def update
    @venuedish = Venuedish.find(params[:id])

    @venuedish.venueid = params[:venueid]
    @venuedish.dishid = params[:dishid]

    save_status = @venuedish.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/venuedishes/#{@venuedish.id}/edit", "/update_venuedish"
        redirect_to("/venuedishes/#{@venuedish.id}", :notice => "Venuedish updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Venuedish updated successfully.")
      end
    else
      render("venuedishes/edit.html.erb")
    end
  end

  def destroy
    @venuedish = Venuedish.find(params[:id])

    @venuedish.destroy

    if URI(request.referer).path == "/venuedishes/#{@venuedish.id}"
      redirect_to("/", :notice => "Venuedish deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Venuedish deleted.")
    end
  end
end
