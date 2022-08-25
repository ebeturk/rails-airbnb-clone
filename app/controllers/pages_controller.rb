class PagesController < ApplicationController
  def home
      params[:query].present?
        sql = "name ILIKE :query OR power ILIKE :query"
        @dragons = Dragon.where(sql, query: "%#{params[:query]}%")

    end
    # @dragons = Dragon.where(active: true).limit(3)
  end
