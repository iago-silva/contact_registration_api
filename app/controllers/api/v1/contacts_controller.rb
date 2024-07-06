# frozen_string_literal: true

module Api
  module V1
    class ContactsController < ApplicationController
      def show
        render json: current_user.contacts.find(params[:id])
      end

      def index
        render json: current_user.contacts.all
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
        contact = current_user.contacts.find(params[:id])
        if contact.update(contact_params)
          render json: contact
        else
          render json: { errors: contact.errors }, status: :unprocessable_entity
        end
      end

      def destroy
        current_user.contacts.find(params[:id]).destroy
      end

      private

      def contact_params
        params.require(:contact).permit(
          :name, :cpf, :phone,
          address_attributes:
            [:zipcode, :number, :street, :neighborhood, :city, :state, :complement]
        )
      end
    end
  end
end
