

# define LAYOUT for views to be rendered into

class CustomController < ApplicationController
  layout "admin"                # defines layoout as default for controller actions

  def index
    render :layout => "custom"  # defines custom layout to use for this action
    render :layout => false     # tells rails to render view without a layout
  end
end


# 

<h1>Products</h1>
<%= render(@products) || "There are no products available." %>

<%= render partial: "product", collection: @products, as: :item %>



<%= render partial: "product", collection: @products, as: :item, locals: {title: "Products Page"} %>