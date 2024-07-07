# frozen_string_literal: true

module Api
  module V1
    class ContactsController < ApplicationController
      def show
        contact = current_user.contacts.find_by(id: params[:id])
        if contact
          # retornar o address serializado
          render json: contact
        else
          head :not_found
        end
      end

      def index
        contacts = current_user.contacts.by_name_or_cpf(params[:search]).page(params[:page])

          # retornar o address serializado
        render json: contacts
      end

      def create
        contact = current_user.contacts.build(contact_params)
        if contact.save
          render json: contact, status: :created
        else
          render json: { errors: contact.errors }, status: :unprocessable_entity
        end
      end

      def update
        contact = current_user.contacts.find_by(id: params[:id])
        if contact
          if contact.update(contact_params)
            render json: contact
          else
            render json: { errors: contact.errors }, status: :unprocessable_entity
          end
        else 
          head :not_found
        end
      end

      def destroy
        contact = current_user.contacts.find_by(id: params[:id])
        if contact
          contact.destroy
        else
          head :not_found
        end
      end

      private

      def contact_params
        params.require(:contact).permit(
          :name, :cpf, :phone,
          address_attributes:
            [
              :zipcode, :number, :street, :neighborhood, 
              :city, :state, :latitude, :longitude, :complement
            ]
        )
      end
    end
  end
end
