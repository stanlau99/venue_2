class DishesbyvenuesController < ApplicationController
  def index
    @dishesbyvenues = Dishesbyvenue.all

    render("dishesbyvenues/index.html.erb")
  end

  def show
    @dishesbyvenue = Dishesbyvenue.find(params[:id])

    render("dishesbyvenues/show.html.erb")
  end

  def new
    @dishesbyvenue = Dishesbyvenue.new

    render("dishesbyvenues/new.html.erb")
  end

  def create
    @dishesbyvenue = Dishesbyvenue.new

    @dishesbyvenue.venueid = params[:venueid]
    @dishesbyvenue.dishid = params[:dishid]

    save_status = @dishesbyvenue.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/dishesbyvenues/new", "/create_dishesbyvenue"
        redirect_to("/dishesbyvenues")
      else
        redirect_back(:fallback_location => "/", :notice => "Dishesbyvenue created successfully.")
      end
    else
      render("dishesbyvenues/new.html.erb")
    end
  end

  def edit
    @dishesbyvenue = Dishesbyvenue.find(params[:id])

    render("dishesbyvenues/edit.html.erb")
  end

  def update
    @dishesbyvenue = Dishesbyvenue.find(params[:id])

    @dishesbyvenue.venueid = params[:venueid]
    @dishesbyvenue.dishid = params[:dishid]

    save_status = @dishesbyvenue.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/dishesbyvenues/#{@dishesbyvenue.id}/edit", "/update_dishesbyvenue"
        redirect_to("/dishesbyvenues/#{@dishesbyvenue.id}", :notice => "Dishesbyvenue updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Dishesbyvenue updated successfully.")
      end
    else
      render("dishesbyvenues/edit.html.erb")
    end
  end

  def destroy
    @dishesbyvenue = Dishesbyvenue.find(params[:id])

    @dishesbyvenue.destroy

    if URI(request.referer).path == "/dishesbyvenues/#{@dishesbyvenue.id}"
      redirect_to("/", :notice => "Dishesbyvenue deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Dishesbyvenue deleted.")
    end
  end
end
