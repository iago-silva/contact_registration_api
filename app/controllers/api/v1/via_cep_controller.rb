module Api
  module V1
    class ViaCepController < ApplicationController
      def index
        response = Faraday.get("https://viacep.com.br/ws/#{params[:cep]}/json")

        render json: response.body
      end
    end
  end
end
