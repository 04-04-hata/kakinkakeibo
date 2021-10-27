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
    @kakeibos = Kakeibo.where(user_id: current_user.id).page(params[:page]).per(5)
    @gacha_billing_amount = GachaKakeibo.where(user_id: current_user.id).sum(:billing_amount)
    @other_billing_amount = OtherKakeibo.where(user_id: current_user.id).sum(:billing_amount)
  end

  def show
    @kakeibo = Kakeibo.find(params[:id])
    #FGOっていうガチャ家計簿の分だけ目的のもの(object)と課金額(billing_amount)を取りたい
    #FGO = kakeibos.name ガチャ家計簿 = is_kakeibo_status:true
    @gacha_billing_amount_ranks = GachaKakeibo.where(user_id: current_user.id, kakeibo_id: params[:id]).order('billing_amount desc').limit(3)
    @total_desc = GachaKakeibo.where(user_id: current_user.id, is_result_status: 1, kakeibo_id: params[:id]).order('total desc').limit(3)
    @other_billing_amount_ranks = OtherKakeibo.where(user_id: current_user.id, kakeibo_id: params[:id]).order('billing_amount desc').limit(3)
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
