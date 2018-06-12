module API
  module V1
    class PlayersController < ApplicationController
      before_action :set_player, only: [:show, :update, :destroy]

      # GET /api/players
      def index
        @players = Player.order(:position)
        if @players
          render json: @players, status: :ok
        else
          render json: { success: false }
        end
      end

      # GET /api/players/1
      def show
        return render_not_found unless @player
        render json: @player, status: :ok
      end

      # POST /api/players
      def create
        @player = Player.new(player_params)
        return render_error unless @player.save
        render json: @player, status: :created
      end

      # PATCH/PUT /api/players/1
      def update
        return render_error unless @player.update(player_params)
        render json: @player, status: :ok
      end

      # DELETE /api/players/1
      def destroy
        return render_not_found unless @player
        @player.destroy
        render json: { success: true }, status: :ok
      end

      def positions
        render json: { positions: Player.positions }, status: :ok
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_player
        @player = Player.find_by(id: params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def player_params
        params.require(:player).permit(:first_name, :last_name, :email, :age, :position)
      end

      def render_not_found
        render json:  { success: false,
                        error: "ID #{params[:id]} not found."
                      },
                      status: :unprocessable_entity
      end

      def render_error
        render json:  { success: false,
                        error: @player.errors
                      },
                      status: :unprocessable_entity
      end
    end
  end
end
