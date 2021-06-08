# frozen_string_literal: true

class Api::V1::RatesController < ApplicationController
  include Authenticatable

  def show
    rate = FindRateQuery.new(name: permitted_params[:name]).call

    render(json: serialize(rate))
  end

  private

  def permitted_params
    params.require(:rate).permit(:name).to_h
  end

  def serialize(rate)
    RateSerializer.new(rate: rate).call
  end
end
