class KakeibosController < ApplicationController

  def new
    @kakeibo = Kakeibo.new
  end

  def create
    @kakeibo = Kakeibo.new(kakeibo_params)
    @kakeibo.user_id = current_user.id
    if @kakeibo.save
      if @kakeibo.is_kakeibo_status == true
        redirect_to new_gacha_kakeibo_path
      else
        redirect_to new_other_kakeibo_path
      end
    else
      render :new
    end

  end

  def index
    @kakeibos = Kakeibo.all
  end

  def show
  end

  def edit

  end

  def update

  end

  def destroy

  end

  private

  def kakeibo_params
    params.require(:kakeibo).permit(:name,:is_kakeibo_status)
  end

end
