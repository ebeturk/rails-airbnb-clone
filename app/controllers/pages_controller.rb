class PagesController < ApplicationController
  def home
    @dragons = Dragon.where(active: true).limit(3)
  end
end
