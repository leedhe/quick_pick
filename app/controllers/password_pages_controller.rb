class PasswordPagesController < ApplicationController
require 'openssl'
require 'digest/sha1'
require 'webster'

  def index
    @password_security = params['security']
      if params['security']
        @password_pages = (1..params['security'].to_i).map{ rand(36).to_s(36) }.join
       # c = OpenSSL::Cipher::Cipher.new("aes-256-cbc")
       # c.encrypt
       # c.key = key = Digest::SHA1.hexdigest("yourpass")
       # c.iv = iv = c.random_iv
       # e = c.update(@password_pages)
       # e << c.final
       # @password_encrypted = "#{e}\n"
        if params[:security] && params[:generate] == "passphrase"
           w = Webster.new
           @passphrases = (1..params['security'].to_i).map{ w.random_word }.join
        end
      else
        render 'index'
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
    @password_security = params['security']
      if params['security']
          @password_pages = (1..params['security'].to_i).map{ rand(36).to_s(36) }.join
         # c = OpenSSL::Cipher::Cipher.new("aes-256-cbc")
       # c.encrypt
       # c.key = key = Digest::SHA1.hexdigest("yourpass")
       # c.iv = iv = c.random_iv
       # e = c.update(@password_pages)
       # e << c.final
       # @password_encrypted = "#{e}\n"
      else
        render 'randompassword'
      end
  end
end
