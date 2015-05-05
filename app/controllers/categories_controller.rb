class CategoriesController < ApplicationController
  before_action :set_category, only: [:show]

  def show

  end

  private 

  def set_category
    @cat = Category.find(params[:id])
  end

end


