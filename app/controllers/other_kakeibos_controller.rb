class OtherKakeibosController < ApplicationController
  def new
    @other_kakeibo = OtherKakeibo.new
    @kakeibo = Kakeibo.where(is_kakeibo_status: 0, user_id: current_user.id)
  end

  def create
    @other_kakeibo = OtherKakeibo.new(other_kakeibo_params)
    @other_kakeibo.user_id = current_user.id
    if @other_kakeibo.save
      redirect_to other_kakeibo_path(@other_kakeibo.id)
    else
      @kakeibo = Kakeibo.where(is_kakeibo_status: 0)
      render :new
    end
  end

  def index
    @other_kakeibos = OtherKakeibo.where(user_id: current_user.id).page(params[:page]).per(5)
    @billing_amount = OtherKakeibo.where(user_id: current_user.id).sum(:billing_amount)
    @billing_ave = 0 # 平均課金額(無課金除く)

    if 0 < @billing_amount
      @billing_ave = OtherKakeibo.where.not(billing_amount: 0).where(user_id: current_user.id).average(:billing_amount).floor
    end
  end

  def show
    @other_kakeibo = OtherKakeibo.find(params[:id])
  end

  def edit
    @other_kakeibo = OtherKakeibo.find(params[:id])
  end

  def update
    @other_kakeibo = OtherKakeibo.find(params[:id])
    if @other_kakeibo.update(other_kakeibo_params)
      redirect_to other_kakeibos_path
    else
      render :edit
    end
  end

  def destroy
    @other_kakeibo = OtherKakeibo.find(params[:id])
    if @other_kakeibo.destroy
      redirect_to other_kakeibos_path
    else
      render :show
    end
  end

  def other_kakeibo_data
    @other_kakeibos = OtherKakeibo.where(kakeibo_id: params[:kakeibo_id],
                                         user_id: current_user.id).page(params[:page]).per(5)
    @billing_amount = OtherKakeibo.where(kakeibo_id: params[:kakeibo_id], user_id: current_user.id).sum(:billing_amount)
    @billing_ave = 0 # 平均課金額(無課金除く)

    if 0 < @billing_amount
      @billing_ave = OtherKakeibo.where.not(billing_amount: 0).where(kakeibo_id: params[:kakeibo_id],
                                                                     user_id: current_user.id).average(:billing_amount).floor
    end
  end

  private

  def other_kakeibo_params
    params.require(:other_kakeibo).permit(:kakeibo_id, :object, :billing_amount, :remarks)
  end
end
