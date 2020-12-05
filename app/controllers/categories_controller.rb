class CategoriesController < ApplicationController
  before_action :set_category, only: [:parent, :child, :grandchild]
end

def parent
  children = @category.children
  grandchirdren = []

  children.each do |child|
    grandchildren << Category.where(ancestry: "#{@category.id}/#{child.id}")
  end
  @items = []

  grandchildren.each do |grandchild|
    grandchild.each do |id|
      @items += Item.where(category_id: id)
    end
  end
end

def 