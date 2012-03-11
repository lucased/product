module Shared
  module NavigationMethods
    
    private 

    def sub_categories
      @sub_categories = SubCategory.all
    end

    def categories
      @categories = Category.all
    end
    
  end
end
