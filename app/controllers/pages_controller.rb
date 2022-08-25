class PagesController < ApplicationController
  def home
      sql = "name @@ :query OR power @@ :query"
      @dragons = Dragon.where(sql, query: "%#{params[:query]}%")

    end
    # @dragons = Dragon.where(active: true).limit(3)
  end
