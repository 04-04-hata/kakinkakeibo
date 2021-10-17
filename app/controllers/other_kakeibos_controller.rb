class OtherKakeibosController < ApplicationController

  def new
    @other_kakeibo = OtherKakeibo.new
    @kakeibo = Kakeibo.where(is_kakeibo_status: 0)
  end

  def create
    @other_kakeibo = OtherKakeibo.new(other_kakeibo_params)
    @other_kakeibo.user_id = current_user.id
    if @other_kakeibo.save
      redirect_to other_kakeibo_path(@other_kakeibo.id)
    else
      @kakeibo = Kakeibo.Where(is_kakeibo_status: 0)
      render :new
    end

  end

  def index
    @other_kakeibos = OtherKakeibo.all
  end

  def show
    #binding.pry
    @other_kakeibo = Otherkakeibo.find(params[:id])
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

  end

  def other_kakeibo_data
    @other_kakeibos = OtherKakeibo.where(kakeibo_id: params[:kakeibo_id])
  end

  private

  def other_kakeibo_params
    params.require(:other_kakeibo).permit(:kakeibo_id,:object,:billing_amount,:remarks)
  end

end
