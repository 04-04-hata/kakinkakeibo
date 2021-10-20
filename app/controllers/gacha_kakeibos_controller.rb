class GachaKakeibosController < ApplicationController

  def new
    @gacha_kakeibo = GachaKakeibo.new
    @kakeibo = Kakeibo.where(is_kakeibo_status: 1)
  end

  def create
    @gacha_kakeibo = GachaKakeibo.new(gacha_kakeibo_params)
    @gacha_kakeibo.user_id = current_user.id
    if @gacha_kakeibo.save
      redirect_to gacha_kakeibo_path(@gacha_kakeibo.id)
    else
      @kakeibo = Kakeibo.where(is_kakeibo_status: 1)
      render :new
    end
  end

  def index
    @gacha_kakeibos = GachaKakeibo.all
    @billing_amount = GachaKakeibo.sum(:billing_amount)
    @billing_ave = GachaKakeibo.where.not(billing_amount: 0).average(:billing_amount).floor
    @total_ave = GachaKakeibo.average(:total).floor
    @billing_item_ave = GachaKakeibo.average(:billing_item).floor
    @result_total_ave = GachaKakeibo.where(is_result_status: 1).average(:total).floor
    @result_billing_item_ave = GachaKakeibo.where(is_result_status: 1).average(:billing_item).floor
  end

  def show
    @gacha_kakeibo = GachaKakeibo.find(params[:id])
  end

  def edit
    @gacha_kakeibo = GachaKakeibo.find(params[:id])
  end

  def update
    @gacha_kakeibo = GachaKakeibo.find(params[:id])
    if @gacha_kakeibo.update(gacha_kakeibo_params)
      redirect_to gacha_kakeibos_path
    else
      render :edit
    end

  end

  def destroy
    @gacha_kakeibo = GachaKakeibo.find(params[:id])
    if @gacha_kakeibo.destroy
      redirect_to gacha_kakeibos_path
    else
      render :show
    end
  end

  def gacha_kakeibo_data
    @gacha_kakeibos = GachaKakeibo.where(kakeibo_id: params[:kakeibo_id])
  end

  private

  def gacha_kakeibo_params
    params.require(:gacha_kakeibo).permit(:kakeibo_id,:object,:billing_amount,:single_gacha,:ten_combo_gacha,:total,:is_result_status,:winning_count,:billing_item,:remarks)
  end

end
