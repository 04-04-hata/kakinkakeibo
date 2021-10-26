class GachaKakeibosController < ApplicationController

  def new
    @gacha_kakeibo = GachaKakeibo.new
    @kakeibo = Kakeibo.where(is_kakeibo_status: 1, user_id: current_user.id)
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
    @gacha_kakeibos = GachaKakeibo.where(user_id: current_user.id)  #全てのガチャ家計簿のデータを取ってくる
    @billing_amount = GachaKakeibo.where(user_id: current_user.id).sum(:billing_amount) #総合課金額
    @billing_ave = 0 #@billing_aveが0の時にviewに表示する
    @total_ave = 0 #@total_aveが0の時にviewに表示する
    @billing_item_ave = 0 #@billing_item_aveが0の時にviewに表示する
    @result_total_ave = 0 #@result_total_aveが0の時にviewに表示する
    @result_billing_item_ave = 0 #@result_billing_item_aveが0の時にviewに表示する

    if 0 < @gacha_kakeibos.sum(:total)
      @total_ave = @gacha_kakeibos.average(:total).floor #総合平均ガチャ回数
    end

    if 0 < @gacha_kakeibos.sum(:billing_amount)
      @billing_ave = @gacha_kakeibos.where.not(billing_amount: 0).average(:billing_amount).floor #総合平均課金額(無課金除く)
    end

    if 0 < @gacha_kakeibos.sum(:billing_item)
      @billing_item_ave = @gacha_kakeibos.average(:billing_item).floor #総合平均課金アイテム消費数
    end

    if 0 < GachaKakeibo.where(user_id: current_user.id, is_result_status: 1).sum(:total)
      @result_total_ave = GachaKakeibo.where(user_id: current_user.id, is_result_status: 1).average(:total).floor #総合平均ガチャ回数(当選時)
    end

    if 0 < GachaKakeibo.where(user_id: current_user.id, is_result_status: 1).sum(:billing_item) #総合平均ガチャ回数(当選時)
      @result_billing_item_ave = GachaKakeibo.where(user_id: current_user.id, is_result_status: 1).average(:billing_item).floor #総合平均課金アイテム消費数(当選時)
    end

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
    @gacha_kakeibos = GachaKakeibo.where(kakeibo_id: params[:kakeibo_id]) #ガチャ家計簿内の家計簿を個別に取ってくる
    @billing_amount = GachaKakeibo.where(kakeibo_id: params[:kakeibo_id]).sum(:billing_amount) #総合課金額
    @billing_ave = 0 #@billing_aveが0の時にviewに表示する
    @total_ave = 0 #@total_aveが0の時にviewに表示する
    @billing_item_ave = 0 #@billing_item_aveが0の時にviewに表示する
    @result_total_ave = 0 #@result_total_aveが0の時にviewに表示する
    @result_billing_item_ave = 0 #@result_billing_item_aveが0の時にviewに表示する

    if 0 < @gacha_kakeibos.sum(:total)
      @total_ave = @gacha_kakeibos.average(:total).floor #総合平均ガチャ回数
    end

    if 0 < @gacha_kakeibos.sum(:billing_amount)
      @billing_ave = @gacha_kakeibos.where.not(billing_amount: 0).average(:billing_amount).floor #総合平均課金額(無課金除く)
    end

    if 0 < @gacha_kakeibos.sum(:billing_item)
      @billing_item_ave = @gacha_kakeibos.average(:billing_item).floor #総合平均課金アイテム消費数
    end

    if 0 < GachaKakeibo.where(kakeibo_id: params[:kakeibo_id], is_result_status: 1).sum(:total)
      @result_total_ave = GachaKakeibo.where(kakeibo_id: params[:kakeibo_id], is_result_status: 1).average(:total).floor #総合平均ガチャ回数(当選時)
    end

    if 0 < GachaKakeibo.where(kakeibo_id: params[:kakeibo_id], is_result_status: 1).sum(:billing_item) #総合平均ガチャ回数(当選時)
      @result_billing_item_ave = GachaKakeibo.where(kakeibo_id: params[:kakeibo_id], is_result_status: 1).average(:billing_item).floor #総合平均課金アイテム消費数(当選時)
    end

  end

  private

  def gacha_kakeibo_params
    params.require(:gacha_kakeibo).permit(:kakeibo_id,:object,:billing_amount,:single_gacha,:ten_combo_gacha,:total,:is_result_status,:winning_count,:billing_item,:remarks)
  end

end
