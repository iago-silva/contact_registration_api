module Api
  module V1
    class ContactsController < ApplicationController
      def show
        render json: user.contacts.find(params[:id])
      end    

      def index
        render json: user.contacts.all
      end    

      def create
        contact = user.contacts.build(contact_params)
        if contact.save
          render json: contact, status: 201
        else
          render json: { errors: contact.errors }, status: 422
        end
      end

      def update
        contact = user.contacts.find(params[:id])
        if contact.update(contact_params)
          render json: contact
        else
          render json: { errors: contact.errors }, status: 422
        end
      end

      def destroy
        user.contacts.find(params[:id]).destroy
      end

      private

      def contact_params
        params.require(:contact).permit(
          :name, :cpf, :phone, 
          address_attributes: 
            [ :zipcode, :number, :street, :neighborhood, :city, :state, :complement ]
        )
      end
    end
  end
end
