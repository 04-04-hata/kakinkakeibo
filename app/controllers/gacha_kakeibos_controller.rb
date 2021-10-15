class GachaKakeibosController < ApplicationController

  def new
    @gacha_kakeibo = GachaKakeibo.new
    @kakeibo = Kakeibo.where(is_kakeibo_status: 1)
  end

  def create
    @gacha_kakeibo = GachaKakeibo.new(gacha_kakeibo_params)
    @gacha_kakeibo.user_id = current_user.id
    if @gacha_kakeibo.save
      redirect_to gacha_kakeibo_path(kakeibos.id)
    else
      render :new
    end
  end

  def index
    @gacha_kakeibos = GachaKakeibo.all
  end

  def show
    @gacha_kakeibo = GachaKakeibo.find(params[:id])
  end

  def edit

  end

  def update

  end

  def destroy

  end

  private

  def gacha_kakeibo_params
    params.require(:gacha_kakeibo).permit(:object,:billing_amount,:single_gacha,:ten_combo_gacha,:total,:is_result_status,:winning_count,:billing_item,:remarks)
  end

end
