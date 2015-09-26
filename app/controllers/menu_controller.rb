class MenuController < ApplicationController
  # skip_before_action :require_login, except: [:destroy]

  def index
    @menu = Menu.paginate(:page => params[:page], :per_page => 10)
  end

  def new
    @menu = Menu.new
  end

  def edit
    @menu = Menu.find_by_id("id")
  end

  def update
    @menu = Menu.find(params[:id])
    if @menu.update(params)
      redirect_to @menu
    else
      render 'edit'
    end
  end

  def create
    @menu = Menu.new(article_param)
    @menu.email=current_user.email

    if @article.save
#      UserMailer.article_email(@menu).deliver
      redirect_to @menu
    else
      render 'new'
    end
  end

  def show
    @menu = Menu.find(params[:id])
  end

  def destroy
    @menu = Menu.find(params[:id])
    @menu.destroy

    redirect_to articles_path
  end

  private
  def params
    params.require(:home).permit(:title, :parent_id, :alias_name, :access, :controller, :action, :sequence_number)
  end

end
