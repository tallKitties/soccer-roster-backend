require 'rails_helper'

module API
  module V1
    describe PlayersController, type: :request do
      let(:valid_attributes) do
        { first_name: 'John', last_name: 'Doe', email: 'john.doe@example.com', age: 25, position: 'goalkeeper' }
      end

      let(:invalid_attributes) do
        { first_name: '', last_name: '', email: '', age: 0, position: '' }
      end

      let(:valid_session) { {} }

      describe 'GET /players' do
        it 'retrieves all the requested player' do
          Player.create! valid_attributes

          get api_v1_players_url,
              as: :json

          expect(response.status).to eq(200)
        end
      end

      describe 'GET /players/:id' do
        context 'with valid params' do
          it 'retrieves the requested player' do
            player = Player.create! valid_attributes

            get api_v1_player_url(player),
                as: :json

            expect(response.status).to eq(200)
          end

          it 'properly sets the success key' do
            player = Player.create! valid_attributes

            get api_v1_player_url(player),
                as: :json

            result = JSON.parse(response.body, symbolize_names: true)
            expect(result[:success]).to eq(true)
          end
        end

        context 'with invalid params' do
          it 'retrieves the requested player' do
            player_id = -1

            get api_v1_player_url(player_id),
                as: :json

            expect(response.status).to eq(422)
          end

          it 'retrieves the requested player' do
            player_id = -1

            get api_v1_player_url(player_id),
                as: :json

            result = JSON.parse(response.body, symbolize_names: true)
            expect(result[:success]).to eq(false)
          end
        end
      end

      describe 'POST /players' do
        context 'with valid params' do
          it 'creates a new Player' do
            expect {
              post api_v1_players_url,
                  params: {player: valid_attributes},
                  as: :json
            }.to change(Player, :count).by(1)

            expect(response.status).to eq(201)
          end

          it 'properly sets the success key' do
            expect {
              post api_v1_players_url,
                  params: {player: valid_attributes},
                  as: :json
            }.to change(Player, :count).by(1)

            result = JSON.parse(response.body, symbolize_names: true)
            expect(result[:success]).to eq(true)
          end
        end

        context 'with invalid params' do
          it 'creates a new player' do
            expect {
              post api_v1_players_url,
                  params: {player: invalid_attributes},
                  as: :json
            }.to change(Player, :count).by(0)

            expect(response.status).to eq(422)
          end

          it 'properly sets the success key' do
            expect {
              post api_v1_players_url,
                  params: {player: invalid_attributes},
                  as: :json
            }.to change(Player, :count).by(0)

            result = JSON.parse(response.body, symbolize_names: true)
            expect(result[:success]).to eq(false)
          end
        end
      end

      describe 'PUT /players/:id' do
        context 'with valid params' do
          let(:new_attributes) do
            {first_name: 'Jane', last_name: 'Doe', email: 'jane.doe@example.com', age: 24}
          end

          it 'updates the requested player' do
            player = Player.create! valid_attributes

            put api_v1_player_url(player),
                params: {player: new_attributes},
                as: :json
            # expect(response.status).to eq(204)
            expect(response.status).to eq(200)
          end

          it 'properly sets the success key' do
            player = Player.create! valid_attributes

            put api_v1_player_url(player),
                params: {player: new_attributes},
                as: :json

            result = JSON.parse(response.body, symbolize_names: true)
            expect(result[:success]).to eq(true)
          end
        end

        context 'with invalid params' do
          it 'updates the requested player' do
            player = Player.create! valid_attributes

            patch api_v1_player_url(player),
                params: {player: invalid_attributes},
                as: :json

            expect(response.status).to eq(422)
          end

          it 'properly sets the success key' do
            player = Player.create! valid_attributes

            patch api_v1_player_url(player),
                params: {player: invalid_attributes},
                as: :json

            result = JSON.parse(response.body, symbolize_names: true)
            expect(result[:success]).to eq(false)
          end
        end
      end

      describe 'DELETE /players/:id' do
        context 'with valid params' do
          it 'destroys the requested player' do
            player = Player.create! valid_attributes

            expect {
              delete api_v1_player_url(player),
              as: :json
            }.to change(Player, :count).by(-1)
            # expect(response.status).to eq(204)
            expect(response.status).to eq(200)
          end

          it 'properly sets success key' do
            player = Player.create! valid_attributes

            expect {
              delete api_v1_player_url(player),
              as: :json
            }.to change(Player, :count).by(-1)

            result = JSON.parse(response.body, symbolize_names: true)
            expect(result[:success]).to eq(true)
          end
        end

        context 'with invalid params' do
          it 'destroys the requested player' do
            player_id = -1

            expect {
              delete api_v1_player_url(player_id),
                    as: :json
            }.to change(Player, :count).by(0)

            expect(response.status).to eq(422)
          end

          it 'properly sets success key' do
            player_id = -1

            expect {
              delete api_v1_player_url(player_id),
              as: :json
            }.to change(Player, :count).by(0)

            result = JSON.parse(response.body, symbolize_names: true)
            expect(result[:success]).to eq(false)
          end
        end
      end
    end
  end
end
