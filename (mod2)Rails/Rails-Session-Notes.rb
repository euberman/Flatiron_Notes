get “/login”, to: “sessions#new” 
post “/login”, to: “sessions#create” 


class SessionsController < ApplicationController
    def new
        # nothing to do here!
    end

    def create
        session[:username] = params[:username]
        redirect_to '/'
    
    def destroy
  		session.delete :username
	end
end


<form method='post'>
  <input name='username'>
  <input type='submit' value='login'>
</form>


# ==================================================

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
class ApplicationController < ActionController::Base
 
  private
 
  # Finds the User with the ID stored in the session with the key
  # :current_user_id This is a common way to handle user login in
  # a Rails application; logging in sets the session value and
  # logging out removes it.
  def current_user
    @_current_user ||= session[:current_user_id] &&
      User.find_by(id: session[:current_user_id])
  end
end
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
class LoginsController < ApplicationController

  # "Create" a login, aka "log the user in"
  def create
    if user = User.authenticate(params[:username], params[:password])
      # Save the user ID in the session so it can be used in
      # subsequent requests
      session[:current_user_id] = user.id
      redirect_to root_url
    end
  end

  # "Delete" a login, aka "log the user out"
  def destroy
    # Remove the user id from the session
    session.delete(:current_user_id)
    # Clear the memoized current user
    @_current_user = nil
    redirect_to root_url
  end
  
  
end

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
<!-- <% if logged_in? -%>Welcome, <%= current_user.name %><% end -%> -->
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
<!--  --> <% if logged_in? %> <% end %> <%= %>
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
<%= render partial: 'users', collection: @users, locals: {size: 30} %>

<%= render partial: "link_area", layout: "graybar" %>

#  access an instance of the @products collection as the item local variable within the partial.
<%= render partial: "product", collection: @products, as: :item %>

# Collection Partial w layout
<%= render partial: "product", collection: @products, layout: "special_layout" %>


# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# LOGIN FORM
<%= form_tag(login_path, :method => :post) do %>

  <div class="field">
    <%= label_tag :email, "Email or Username", class: 'label' %>
    <%= text_field_tag :email, nil, class: 'input', autofocus: true %>
  </div>

  <div class="field">
    <%= label_tag :password, "Password", class: 'label' %>
    <%= password_field_tag :password, nil, class: 'input' %>
  </div>

  <%= submit_tag("Login", class: 'button is-primary') %>
<% end %>

<br />

<%= link_to "Create an Account", new_user_path, class: 'button is-secondary' %>
<%= link_to "Forgot Password", forgot_password_user_path, class: 'button is-secondary' %>