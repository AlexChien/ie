class CategoriesController < ApplicationController
  def show
    category = Category.find_by_path("/#{params[:path]}")
    redirect_to "/" unless category
  end
end
