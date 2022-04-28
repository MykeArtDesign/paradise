# frozen_string_literal: true

module Api
  module V1
    class DestinationsController < ApplicationController
      before_action :set_destination_id, only: %i[show edit update destroy]

      def index
        @destinations = Destination.all
      end

      def show; end

      def new
        @destination = Destination.new
      end

      def create
        @destination = Destination.new(destination_params)
        @destination.save
        redirect_to destination_path(@destination)
      end

      def update
        @destination.update(destination_params)
        redirect_to destination_path(@destination)
      end

      def destroy
        @destination.destroy
        redirect_to destinations_path
      end

      private

      def destination_params
        params.require(:destination).permit(:name, :description, :address, :rate, :photo_url)
      end

      def set_destination_id
        @destination = Destination.find(params[:id])
      end
    end
  end
end
