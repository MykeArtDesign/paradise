# frozen_string_literal: true

module Api
  module V1
    class DestinationsController < ApplicationController
      before_action :authorize_access_request!, except: %i[index show]
      before_action :set_destination_id, only: %i[show edit update destroy]

      def index
        @destinations = Destination.all

        render json: @destinations
      end

      def show
        render json: destination
      end

      def create
        @destination = Destination.new(destination_params)
        if @destination.save
          render json:@destination, status: :created, location: @destination
        else
          render json: @destination.errors, status: :unprocessable_entity
        end
      end

      def update
        if @destination.update(destination_params)
          render json: @destination
        else
          render json: @destination.errors, status: :unprocessable_entity
        end
      end

      def destroy
        @destination.destroy
        redirect_to destinations_path
      end

      private

      def destination_params
        params.require(:destination).permit(:name, :description, :address, :rate, :photo_url, :user_id)
      end

      def set_destination_id
        @destination = Destination.find(params[:id])
      end
    end
  end
end
