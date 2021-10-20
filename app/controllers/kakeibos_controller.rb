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
    @gacha_billing_amount = GachaKakeibo.sum(:billing_amount)
    @other_billing_amount = OtherKakeibo.sum(:billing_amount)
  end

  def show
    @kakeibo = Kakeibo.find(params[:id])

  end

  def edit
    @kakeibo = Kakeibo.find(params[:id])
  end

  def update
    @kakeibo = Kakeibo.find(params[:id])
    if @kakeibo.update(kakeibo_params)
      redirect_to kakeibos_path
    else
      render :edit
    end

  end

  private

  def kakeibo_params
    params.require(:kakeibo).permit(:name,:is_kakeibo_status)
  end

end
