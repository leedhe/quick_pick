class PasswordPagesController < ApplicationController

  def index
    if params['c_num'] && params['security']
      @password_pages = Array.new(8){[*'0'..'9', *'a'..'z', *'A'..'Z'].sample}.join.where(c_num: params['c_num'], security: params['security'])
    else
      @password_pages = PasswordPage.all
    end
  end

  def show
    @password_page = PasswordPage.find_by(id: params[:id])
  end

  def new
  end

  def create
    @password_page = PasswordPage.new
    @password_page.c_num = params[:c_num]
    @password_page.security = params[:security]
    @password_page.like = params[:like]
    @password_page.comment = params[:comment]

    if @password_page.save
      redirect_to "/password_pages/#{ @password_page.id }"
    else
      render 'new'
    end
  end

  def edit
    @password_page = PasswordPage.find_by(id: params[:id])
  end

  def update
    @password_page = PasswordPage.find_by(id: params[:id])
    @password_page.c_num = params[:c_num]
    @password_page.security = params[:security]
    @password_page.like = params[:like]
    @password_page.comment = params[:comment]

    if @password_page.save
      redirect_to "/password_pages/#{ @password_page.id }"
    else
      render 'edit'
    end
  end

  def destroy
    @password_page = PasswordPage.find_by(id: params[:id])
    @password_page.destroy


    redirect_to "/password_pages"
  end
  
  def randompassword
  end
end
