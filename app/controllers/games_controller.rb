class GamesController < ApplicationController
  before_action :set_game, only: %i[ show edit update destroy ]
  before_action :index_msg2, only: [ :show ]
  before_action :print_footer
  layout "header_only", only: [:index]

  # GET /games or /games.json
  def index

    @games = Game.all
    @msg = print_hello

    @num1 = 1
    num2 = 2
    @sum = @num1+num2
    @msg2 = "Yo"
    @header_message = "Ako ang official header from controller"
    @arr = [1,2,3]
  end

  # GET /games/1 or /games/1.json
  def show
    @header_message = "Ako ang official header from controller na show method"
  end

  def print_hello
    "hello"
  end

  # GET /games/new
  def new
    @game = Game.new
  end

  # GET /games/1/edit
  def edit
  end

  # POST /games or /games.json
  def create
    @game = Game.new(game_params)

    respond_to do |format|
      if @game.save
        format.html { redirect_to @game, notice: "Game was successfully created." }
        format.json { render :show, status: :created, location: @game }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /games/1 or /games/1.json
  def update
    respond_to do |format|
      if @game.update(game_params)
        format.html { redirect_to @game, notice: "Game was successfully updated." }
        format.json { render :show, status: :ok, location: @game }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /games/1 or /games/1.json
  def destroy
    @game.destroy
    respond_to do |format|
      format.html { redirect_to games_url, notice: "Game was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_game
      @game = Game.find(params[:id])
    end

    def index_msg2
      
    end

    def print_footer
      @footer_content = "footer content"
    end

    # Only allow a list of trusted parameters through.
    def game_params
      params.require(:game).permit(:name, :genre, :price, :platform)
    end
end
