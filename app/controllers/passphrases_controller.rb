class PassphrasesController < ApplicationController
  require "webster"
  
  def index
    w = Webster.new
     if params['security']
       @passphrases = (1..params['security'].to_i).map{ w.random_word }.join
     else
       @passphrases = Passphrase.all
     end
  end

  def show
    @passphrase = Passphrase.find_by(id: params[:id])
  end

  def new
  end

  def create
    @passphrase = Passphrase.new
    @passphrase.words = params[:words]
    @passphrase.security = params[:security]
    @passphrase.word_type = params[:word_type]

    if @passphrase.save
      redirect_to "/passphrases/#{ @passphrase.id }"
    else
      render 'new'
    end
  end

  def edit
    @passphrase = Passphrase.find_by(id: params[:id])
  end

  def update
    @passphrase = Passphrase.find_by(id: params[:id])
    @passphrase.words = params[:words]
    @passphrase.security = params[:security]
    @passphrase.word_type = params[:word_type]

    if @passphrase.save
      redirect_to "/passphrases/#{ @passphrase.id }"
    else
      render 'edit'
    end
  end

  def destroy
    @passphrase = Passphrase.find_by(id: params[:id])
    @passphrase.destroy


    redirect_to "/passphrases"
  end
  
  def random_passphrase
  end
end
