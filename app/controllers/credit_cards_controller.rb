
class CreditCardsController < ApplicationController
  before_action :validate_card
  attr_accessor :number

  def index
    @credit_cards = CreditCard.all
  end

  def show
  end

  def new
    @credit_card = CreditCard.new
  end

  def create
    @credit_card = CreditCard.new()

    respond_to do |format|
      if @credit_card.save
        format.html { redirect_to @credit_card, notice: 'Credit card was successfully created.' }
        format.json { render :show, status: :created, location: @credit_card }
      else
        format.html { render :new }
        format.json { render json: @credit_card.errors, status: :unprocessable_entity }
      end
    end
  end

  def validate_card
    @number = params[:number]
    if @number.present?
      @valid = CardValidation.new(@number).call
      @type = CardType.new(@number).call
    end
    render 'index'
  end

  def destroy
    @credit_card.destroy
    respond_to do |format|
      format.html { redirect_to credit_cards_url, notice: 'Credit card was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_credit_card
    @credit_card = CreditCard.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def credit_card_params
    params.permit(:number, :type, :validation)
  end
end